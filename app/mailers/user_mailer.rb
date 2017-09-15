require 'rest-client'
class UserMailer < ApplicationMailer
  # default to: Proc.new { ['1111111@qq.com','22222222@qq.com'] },
  #   from: "xiaoyang20170204@gmail.com"
  default from: "xiaoyang20170204@gmail.com"
  layout 'mailer'

  def welcome_email(user)
    @user = user
    # email_with_name = %("#{@user.nickname}" <#{@user.email}>)
    @url = 'http://localhost:3000'
    # attachments = {}
    # attachments.inline['image.jpg'] = File.read('public/image.jpg')
    # mail(to: email_with_name, subject: 'Welcome to My Awesome Site')
    # delivery_options = { user_name: 'peck',
    #                  password: '34251664',
    #                  address: 'localhost:4000' }
    # mail(
    #  subject: 'Welcome to My Awesome Site',
    #  delivery_method_options: delivery_options)
    mail(to: 'darkspider2016@foxmail.com',subject: 'Welcome to My Awesome Site')
  end

  def send_simple_message
      RestClient.post "https://api:key-..."
          "api...",
          :from => "Mailgun Sandbox <...>",
          :to => "xiaoyang20170204@gmail.com <xiaoyang20170204@gmail.com>",
          :subject => "Hello xiaoyang20170204@gmail.com",
          :text => "Congratulations xiaoyang20170204@gmail.com, you just sent an email with Mailgun!  You are truly awesome!"
  end

  def receive(email)
    page = Page.find_by(address: email.to.first)
    page.emails.create(
      subject: email.subject,
      body: email.body
    )

    if email.has_attachments?
      email.attachments.each do |attachment|
        page.attachments.create({
          file: attachment,
          description: email.subject
        })
      end
    end
  end
end
