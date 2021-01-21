class InquiriesController < ApplicationController
  def new
    @inquiry = Inquiry.new
  end

  def create
    @inquiry = Inquiry.new(inquiry_params)
    InquiryMailer.received_email(@inquiry).deliver
    redirect_to thanks_path
  end
  
  def thanks
  end

  private

  def inquiry_params
    params.require(:inquiry).permit(:name, :email, :message)
  end
end
