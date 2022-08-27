class Public::CommentsController < ApplicationController
    before_action :authenticate_customer!

  def create
    post_content = PostContent.find(params[:comment][:post_id])
    @comment = post_content.comments.build(comment_params)
    @comment.customer_id = current_customer.id
    if @comment.save
      flash[:success] = "コメントしました"
      redirect_back(fallback_location: root_path)
    else
      flash[:success] = "コメントできませんでした"
      redirect_back(fallback_location: root_path)
    end
  end

  private

    def comment_params
      params.require(:comment).permit(:content)
    end
end
