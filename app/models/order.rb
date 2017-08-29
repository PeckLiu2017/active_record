class Order < ApplicationRecord
  belongs_to :client, counter_cache: true
  scope :filter_income, ->(price) { where( "price > ?",price ) }
  scope :created_before, ->(time) { where("created_at < ?", time) }

  before_save :normalize_card_number, if: Proc.new { |order| order.paid_with_card? }

  def normalize_card_number
    puts "call normalize_card_number"
  end

  def paid_with_card?
    true
  end

end
