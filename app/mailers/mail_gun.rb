class MailGun < ApplicationMailer

  def sign_up_success(email)
      mail to: email, subject:"Welcome to SlimSpace.io"
  end

  def approve_deny(space,booking,user,email)
    @space= space
    @booking= booking
    @user= user
    @email= email
    mail to: email, subject:"You have a new request"
  end

  def reservation_destroyed(space,booking,user,email)
    @space= space
    @booking= booking
    @user= user
    @email= email
    mail to: email, subject:"Your booking has been denied"
  end

  def reservation_pending(space,booking,user,email)
    @space= space
    @booking= booking
    @user= user
    @email= email
    mail to: email, subject:"Your booking is pending"
  end

  def reservation_success(space,booking,user,email)
    @space= space
    @booking= booking
    @user= user
    @email= email
    mail to: email, subject:"Your booking has been approved"
  end

  def reservation_updated(space,booking,user,email)
    @space= space
    @booking= booking
    @user= user
    @email= email
    mail to: email, subject:"Your booking has been updated"
  end



end
