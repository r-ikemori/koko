class Public::CommentsController < ApplicationController
  before_action :authenticate_customer!

  def create
    post_content = PostContent.find(params[:comment][:post_id])
    @comment = post_content.comments.build(comment_params)
    @comment.customer_id = current_customer.id
    flash[:success] = if @comment.save
                        'コメントしました'
                      else
                        'コメントできませんでした'
                      end
    redirect_back(fallback_location: root_path)
  end

  def destroy
    @comment = Comment.find(params[:id])
    if @post_content.customer == current_customer
      redirect_back(fallback_location: root_path) if @comment.destroy
    else
      redirect_to maps_path
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:content)
  end
end
