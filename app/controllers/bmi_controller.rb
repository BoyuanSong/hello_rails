class BmiController < ApplicationController
  def index
    @bmi_calculator = BmiCalculator.new
  end

  def result
    @bmi_calculator = BmiCalculator.new(bmi_calculator_params)

    if @bmi_calculator.valid?
      @bmi = @bmi_calculator.perform

      if @bmi >= 0 && @bmi <= 18
        @comment = "體重過輕了"
      elsif @bmi > 18 && @bmi <= 25
        @comment = "體重適中"
      elsif @bmi > 25
        @comment = "體重過重請注意身體健康"
      else
        @comment = "請輸入正確的身高體重"
      end
    else
      @msg = "請輸入身高體重"
      render :index
    end
  end

  private
  def bmi_calculator_params
    params.require(:bmi_calculator).permit(:body_height, :body_weight)
  end
end
