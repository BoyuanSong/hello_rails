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
      redirect_to visitors_path, notice: "新增資料成功!"
    else # 失敗
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
    @user = Visitor.find_by(account: params[:account])
    if  @user != nil and params[:pw] == @user.pw
      session[:user] = @user.serialize
      redirect_to visitors_path, notice: "登入成功!"
    else
      @error = "請輸入正確的帳號密碼"
      render :log
    end
  end

  def log_out
    session[:user] = nil
    redirect_to visitors_path, notice: "登出成功"
  end

end
