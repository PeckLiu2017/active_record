class LineItem < ApplicationRecord
  belongs_to :book, -> { includes :author }
end
