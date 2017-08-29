class Article < ApplicationRecord
  after_destroy :log_destroy_action
  has_many :comments
  def log_destroy_action
    puts 'Article destroyed'
  end

  def ignore_comments?
    # true
    false
  end
end
