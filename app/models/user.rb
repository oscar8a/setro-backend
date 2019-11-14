class User < ApplicationRecord
  has_many :orders
  
  has_secure_password

  validates_presence_of :first_name, :email
  validates_uniqueness_of :email

  def create_cart
    userID = self.id 
    Order.create(user_id: userID)
  end
  
end
