class InquiryController < ApplicationController
  def new
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
  
  private

  def inquiry_params
    params.require(:inquiry).permit(:name, :email, :message)
  end
end
