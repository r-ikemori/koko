class Admin::CommentsController < ApplicationController
  def destroy
    @comment = Comment.find(params[:id])
    redirect_back(fallback_location: root_path) if @comment.destroy
  end
end
