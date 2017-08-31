class Product < ApplicationRecord
  has_many :pictures, as: :imageable
  validates :legacy_code, format: { with: /\A[a-zA-Z]+\z/,
    message: "only allows letters" }
end
