class ContactDetail < ApplicationRecord
  belongs_to :person
  # validates_presence_of :telephone
end
