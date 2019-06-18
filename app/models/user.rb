class User < ApplicationRecord
  has_many :addresses, through: :user_addresses
  has_many :orders
end
