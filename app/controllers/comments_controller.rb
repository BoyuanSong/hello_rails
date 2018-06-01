class CommentsController < ApplicationController

  def index
    # 全部留言內容 最新的會在最上面
    @comments = Comment.page(params[:page]).per(5).order(id: :desc)

    # 給新增留言用的
    @comment = Comment.new
  end

  def create
    @user = session[:user]

    # 沒登入就用訪客帳號留言
    if @user.nil?
      @visitor = Visitor.find_by(account: :no_log_in)
    # 有登入就取得登入帳號
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
