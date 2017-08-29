class User < ApplicationRecord
  has_many :articles, dependent: :destroy
  after_initialize do |user|
    puts "You have initialized an object!"
  end

  after_find do 
    puts "You have found an object!"
  end
end
