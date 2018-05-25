class CartsController < ApplicationController
  def add
    @cart.add_item(params[:id])
    session[:cart318] = @cart.serialize

    redirect_to products_path, notice: "已加入購物車"
  end

  def destroy
    session[:cart318] = nil
    redirect_to products_path, notice: "購物車已清空"
  end
end
