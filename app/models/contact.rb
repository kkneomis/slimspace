class Contact < MailForm::Base
  attribute :name,      :validate => true
  attribute :email,     :validate => /\A([\w\.%\+\-]+)@([\w\-]+\.)+([\w]{2,})\z/i
  attribute :file,      :attachment => true

  attribute :message
  attribute :nickname,  :captcha  => true

  # Declare the e-mail headers. It accepts anything the mail method
  # in ActionMailer accepts.
  def headers
    {
        :subject => "SlimSpace Contact Form",
        :to => "slimspaceio@gmail.com, ajhenley@gmail.com, skakpovi@gmail.com",
        :from => %("#{name}" <#{email}>)
    }
  end
end