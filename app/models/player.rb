class Player < ApplicationRecord
  validates :points, numericality: true
  validates :games_played, numericality: { only_integer: true, greater_than:1 }
  # before_validation :v
  # 这里传入的数值要是字符串
end
