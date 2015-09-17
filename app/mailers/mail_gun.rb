class MailGun < ApplicationMailer

  def sign_up_success(email)
      mail to: email, subject:"Welcome to SlimSpace.io"
  end

  def approve_deny(space,booking,user,email)
    mail to: email, subject:"You have a new request"
  end

end
