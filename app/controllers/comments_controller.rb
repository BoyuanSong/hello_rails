class CommentsController < ApplicationController
  def index
    @comments = Comment.all
    @comment = Comment.new
  end

  def create
    @user = session[:user]

    if @user.nil?
      @visitor = Visitor.find_by(account: :fortest)
    else
      @visitor = Visitor.find_by(id: @user["id"])
    end

    @visitor.comments.create(params.require(:comment).permit(:content))

    redirect_to comments_path
  end

  def destroy
    @comment = Comment.find_by(id: params[:id])
    @comment.destroy if @comment
    redirect_to comments_path, notice: "留言已刪除!"
  end
end
