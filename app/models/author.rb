class Author < ApplicationRecord
  # has_many :books
  has_many :books, dependent: :destroy
  # has_many :books, inverse_of: 'writer'
  validates_associated :books
end
