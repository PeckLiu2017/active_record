class Assembly < ApplicationRecord
  has_and_belongs_to_many :parts
  # Assembly.last.parts
end
