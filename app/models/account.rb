class Account < ApplicationRecord
  belongs_to :supplier
  has_one :accounthistroy
end