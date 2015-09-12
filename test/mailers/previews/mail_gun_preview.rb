# Preview all emails at http://localhost:3000/rails/mailers/mail_gun
class MailGunPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/mail_gun/sign_up_success
  def sign_up_success
    MailGun.sign_up_success
  end

end
