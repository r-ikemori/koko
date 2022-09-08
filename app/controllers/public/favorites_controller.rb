class Public::FavoritesController < ApplicationController
    def create
      @post_favorite = current_customer.favorites.new(post_content_id: params[:post_content_id])
      @post_favorite.save
      redirect_to post_content_path(params[:post_content_id]) 
    end
    
    def index
      @customer = current_customer
      favorites= current_customer.favorites.pluck(:post_content_id)
      @favorite_posts = PostContent.find(favorites)
    end
    
    def destroy
      @post_favorite = current_customer.favorites.find_by(post_content_id: params[:post_content_id])
      @post_favorite.destroy
      redirect_to post_content_path(params[:post_content_id]) 
    end
end
