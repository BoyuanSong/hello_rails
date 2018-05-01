class BmiController < ApplicationController
  def index
    @bmi_calculator = BmiCalculator.new
  end

  def result
    @bmi_calculator = BmiCalculator.new(bmi_calculator_params)

    if @bmi_calculator.valid?
      @bmi = @bmi_calculator.perform

      if @bmi >= 0 && @bmi <= 18
        @comment = "體重過輕"
      elsif @bmi > 18 && @bmi <= 25
        @comment = "體重適中"
      elsif @bmi > 25 && @bmi <= 30
        @comment = "體重過重"
      else
        @comment = "請注意體重控制"
      end
    else
      render :index
    end
  end

  private
  def bmi_calculator_params
    params.require(:bmi_calculator).permit(:body_height, :body_weight)
  end
end
