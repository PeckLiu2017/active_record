class User < ApplicationRecord
  has_many :articles, dependent: :destroy
  has_one :profile
  # User.find(2003).gender => "female"
  delegate :gender, to: :profile, allow_nil: true
  # User.find(2003).profile_gender => "female"
  delegate :gender, to: :profile, prefix: true
  # after_initialize do |user|
  #   puts "You have initialized an object!"
  # end
  #
  # after_find do
  #   puts "You have found an object!"
  # end
  # self.primary_key = 'guid' # 主键是 guid，不是 id
  has_many :todos, primary_key: :guid
  has_one :contact_detail
  delegate :email, to: :contact_detail, allow_nil: true
end
