class InquiriesController < ApplicationController
  before_action :authenticate_user!,except: [:new, :create, :thanks]

  def new
    @inquiry = Inquiry.new
  end

  def create
    @inquiry = Inquiry.new(inquiry_params)
    if @inquiry.save
      InquiryMailer.received_email(@inquiry).deliver
      redirect_to thanks_path
    else
      render :new
    end
  end

  def thanks
  end

  private

  def inquiry_params
    params.require(:inquiry).permit(:name, :email, :message)
  end
end
