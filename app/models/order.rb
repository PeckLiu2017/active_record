class Order < ApplicationRecord
  belongs_to :client, counter_cache: true
  scope :filter_income, ->(price) { where( "price > ?",price ) }
  scope :created_before, ->(time) { where("created_at < ?", time) }
end
