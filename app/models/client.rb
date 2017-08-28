class Client < ApplicationRecord
  has_one :address
  has_many :orders
  has_and_belongs_to_many :roles
  # self.lock_optimistically = false
end


# c1 = Client.find(1)
# c2 = Client.find(1)
#
# c1.telephone = "15829261791"
# c1.save
#
# c2.name = "should fail"
# c2.save # 抛出 ActiveRecord::StaleObjectError

# Client.transaction do
#   i = Client.lock.first
#   i.name = "Mike"
#   i.save!
# end

# clients = Client.limit(6)
#
# clients.each do |client|
#   puts client.address.city
# end


# clients = Client.includes(:address).limit(6)
#
# clients.each do |client|
#   puts client.address.city
# end
