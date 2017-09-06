class UserMailer < ApplicationMailer
  default from: "from@example.com"
  layout 'mailer'

  def welcome_email(user)
    @user = user
    email_with_name = %("#{@user.nickname}" <#{@user.email}>)
    @url = 'http://localhost:3000'
    # attachments = {}
    # attachments.inline['image.jpg'] = File.read('public/image.jpg')
    mail(to: email_with_name, subject: 'Welcome to My Awesome Site')
  end
end
