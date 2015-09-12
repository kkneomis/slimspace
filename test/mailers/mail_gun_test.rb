require 'test_helper'

class MailGunTest < ActionMailer::TestCase
  test "sign_up_success" do
    mail = MailGun.sign_up_success
    assert_equal "Sign up success", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
