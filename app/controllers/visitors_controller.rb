class VisitorsController < ApplicationController

  # 無登入用訪客帳號為id:1, 取得訪客清單時避掉這個
  def index
    @visitors = Visitor.where("id > 1")
  end

  def new
    @visitor = Visitor.new
  end

  def create
    @visitor = Visitor.new(params.require(:visitor).permit(:account, :pw, :name, :email))

    # 成功
    if @visitor.save
      redirect_to visitors_path, notice: "新增資料成功!"
    # 失敗
    else
      render :new
    end
  end

  # 設計是只能刪自己的帳號 可看到自己留言一起被刪
  def destroy
    @visitor = Visitor.find_by(id: params[:id])
    @visitor.destroy if @visitor
    session[:user] = nil
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
    session[:cart318] = nil
    redirect_to visitors_path, notice: "登出成功"
  end
end
