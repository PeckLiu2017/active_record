class Product < ApplicationRecord
  has_many :pictures, as: :imageable
  validates :name, presence: true
end
