class VisitorsController < ApplicationController

  def index
    @visitors = Visitor.all
  end

  def new
    @visitor = Visitor.new
  end

  def create
    @visitor = Visitor.new(params.require(:visitor).permit(:account, :pw, :name, :email))

    if @visitor.save # 成功
      redirect_to visitors_path, notice: "新增成功!"
    else # 失敗
      flash[:errors] = @visitor.errors.full_messages
      render :new
    end
  end

  def destroy
    puts params
    @visitor = Visitor.find_by(id: params[:id])
    @visitor.destroy if @visitor
    redirect_to visitors_path, notice: "訪客已刪除!"
  end

  def log
  end

  def log_in
    if @user = Visitor.find_by(account: params[:account])
      session[:user] = @user.serialize
      redirect_to visitors_path, notice: "登入成功!"
    else
      render :log
    end
  end

  def log_out
    session[:user] = nil
    redirect_to visitors_path, notice: "登出"
  end

end
