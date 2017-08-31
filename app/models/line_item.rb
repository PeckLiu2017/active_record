class LineItem < ApplicationRecord
  belongs_to :book, -> { includes :author }
  # validates :book, presence: true
  validates :book, absence: true
end
