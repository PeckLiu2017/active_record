class Person < ApplicationRecord
  # 用法1
  # validates :name, presence: true
  # 这个方法检查表单提交时，用户界面中的复选框是否被选中。一般用来要求用户接受应用的服务条款、确保用户阅读了一些文本，等等。
  # 仅当 terms_of_service 不为 nil 时才会执行这个检查。
  # 下例terms_of_service的类型要为boolean
  # validates :terms_of_service, acceptance: true
  # 自定义可接受类型和错误提示信息，也可以将accept和message分开写。
  validates :terms_of_service, acceptance: { accept: ['TRUE', 'accepted'], message: 'must be abided' }
  # validates :terms_of_service, acceptance: { message: 'must be abided' }
  # validates :terms_of_service, acceptance: { accept: 'yes' }
  validates :email, confirmation: true, uniqueness: { scope: :name,
    message: "should happen once per name" }
  validates :email_confirmation, presence: true
  validates :name, length: { minimum: 6 }
  validates :password, length: { in: 6..20 }
  # validates :password, length: { is: 6 }
  # validates :name, uniqueness: { case_sensitive: false }
end
