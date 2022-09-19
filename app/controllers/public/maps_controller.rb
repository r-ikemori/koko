class Public::MapsController < ApplicationController
  before_action :authenticate_customer!, except: [:top]
  def index
    @post_content = PostContent.new
    @post_contents = PostContent.all
  end

  private

  def map_params
    params.require(:map).permit(:title, :content, :address, :latitude, :longitude)
  end

end
