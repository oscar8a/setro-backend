class User < ApplicationRecord
  has_many :orders

  has_secure_password

  validates_presence_of :first_name, :email
  validates_uniqueness_of :email
  
end
