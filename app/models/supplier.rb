class Supplier < ApplicationRecord
  has_one :account
  has_one :accounthistroy, through: :account
end
