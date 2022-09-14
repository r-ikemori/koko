class Admin::PostContentsController < ApplicationController
  before_action :authenticate_admin!
  def show
    @post_content = PostContent.find(params[:id])
    @comments = @post_content.comments
    @comment = @post_content.comments
  end
  
  def destroy
    @post_content = PostContent.find(params[:id])
    @post_content.destroy
    redirect_to admin_path
  end
  
  def ranking
     
    @prefecture = params[:prefecture]
    if @prefecture
      @post_contents = PostContent.includes(:favorites).where(prefectures: @prefecture).sort {|a,b| b.favorites.size <=> a.favorites.size}
    else
       @post_contents = PostContent.includes(:favorites).where(prefectures: "東京都").sort {|a,b| b.favorites.size <=> a.favorites.size}
       @prefecture = "東京都"
    end
  end
  
end
