class Supplier < ApplicationRecord
  # has_one :account
  has_one :account, -> { includes :representative }
  has_one :accounthistroy, through: :account
end
