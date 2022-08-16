class Public::MapsController < ApplicationController
  def index
    @post_content = PostContent.new
  end

  private

  def map_params
    params.require(:map).permit(:title, :content, :address, :latitude, :longitude)
  end

end
