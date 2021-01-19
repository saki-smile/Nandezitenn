class HomesController < ApplicationController
  def top
    @rank = Question.joins(:favorites).group(:question_id).order('count(question_id) desc').limit(3)
    @inquiry = Inquiry.new
  end

  def create
    @inquiry = Inquiry.new(inquiry_params)
    if @inquiry.save
      flash[:notice] = "問合せを受付けけました"
      redirect_to root_path
    else
      render :top
    end
  end

  def about
  end

  private

  def inquiry_params
    params.require(:inquiry).permit(:name, :email, :message)
  end
end
