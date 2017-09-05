class User < ApplicationRecord
  has_many :articles, dependent: :destroy
  has_one :profile
  delegate :gender, to: :profile
  after_initialize do |user|
    puts "You have initialized an object!"
  end

  after_find do
    puts "You have found an object!"
  end
  # self.primary_key = 'guid' # 主键是 guid，不是 id
  has_many :todos, primary_key: :guid
end
