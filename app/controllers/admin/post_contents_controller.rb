class Admin::PostContentsController < ApplicationController
  def show
    @post_content = PostContent.find(params[:id])
    @comments = @post_content.comments
    @comment = @post_content.comments.build
  end
end
