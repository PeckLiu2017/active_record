class Address < ApplicationRecord
  belongs_to :client
  enum availability: [:available, :unavailable]
end
