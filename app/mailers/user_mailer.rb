class UserMailer < ApplicationMailer
  default to: Proc.new { ['1111111@qq.com','22222222@qq.com'] },
    from: "from@example.com"
  layout 'mailer'

  def welcome_email(user)
    @user = user
    # email_with_name = %("#{@user.nickname}" <#{@user.email}>)
    @url = 'http://localhost:3000'
    # attachments = {}
    # attachments.inline['image.jpg'] = File.read('public/image.jpg')
    # mail(to: email_with_name, subject: 'Welcome to My Awesome Site')
    mail(subject: 'Welcome to My Awesome Site')
  end
end
