class Todo < ApplicationRecord
  # belongs_to :user, primary_key: 'guid'
  belongs_to :user
end
