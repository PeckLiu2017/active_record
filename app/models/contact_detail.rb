class ContactDetail < ApplicationRecord
  belongs_to :person
  # validates_presence_of :telephone
  belongs_to :user
end
