class Public::PostContentsController < ApplicationController
  def new
    @latitude = params[:post_content][:latitude]
    @longitude = params[:post_content][:longitude]
    @post_content = PostContent.new
    address_code = params[:post_content][:latitude] + "," + params[:post_content][:longitude]
    Geocoder.configure(language: :ja)
    @address =  Geocoder.address(address_code).split(', ')[0..2].reverse!.join('')
  end
  
  def create
    @post_content = PostContent.new(post_content_params)
    @post_content.customer_id = current_customer.id
    @post_content.save
    redirect_to post_content_path(@post_content.id)
  end

  def show
    @post_content = PostContent.find(params[:id])
  end

  def index
  end
  
   private

  def post_content_params
    params.require(:post_content).permit(:description, :address, :name, :latitude, :longitude, :image, :prefectures,)
  end

end
