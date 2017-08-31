class Person < ApplicationRecord
  # 用法1
  # validates :name, presence: true
  # 这个方法检查表单提交时，用户界面中的复选框是否被选中。一般用来要求用户接受应用的服务条款、确保用户阅读了一些文本，等等。
  # 仅当 terms_of_service 不为 nil 时才会执行这个检查。
  # validates :terms_of_service, acceptance: true
  # validates :terms_of_service, acceptance: { message: 'must be abided' }
  validates :terms_of_service, acceptance: { accept: 'yes' }
  # validates :eula, acceptance: { accept: ['TRUE', 'accepted'] }
end
