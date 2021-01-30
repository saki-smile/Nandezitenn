class InquiryMailer < ApplicationMailer
  default from: "example@example.com"

  def received_email(inquiry)
    @inquiry = inquiry
    # mail to: ENV["INQUIRY_MAIL"], subject: '【サイト名】 お問い合わせありがとうございます'
    mail(:to => ENV["INQUIRY_MAIL"], :subject => 'お問い合わせを承りました')
  end
end
