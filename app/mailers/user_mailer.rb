class UserMailer < ApplicationMailer
  default from: "from@example.com"
  layout 'mailer'

  def welcome_email(user)
    @user = user
    @url = 'http://localhost:3000'
    attachments = {}
    attachments['filename.jpg'] = File.read('public/apple-touch-icon.png')
    mail(to: '943207041@qq.com', subject: 'Welcome to My Awesome Site')
  end
end
