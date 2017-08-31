class Account < ApplicationRecord
  belongs_to :supplier
  has_one :accounthistroy
  belongs_to :representative
  # the word "in" in next line  can be repalced by "with"
  validates :subdomain, exclusion: { in: %w(www us ca jp),
  message: "this value is reserved." }
end
