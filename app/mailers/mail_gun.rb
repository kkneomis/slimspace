class MailGun < ApplicationMailer

  def sign_up_success(email)
    @greeting = "Hi"

    mail to: email, subject:"hi"
  end
end
