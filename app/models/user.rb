class User < ApplicationRecord
  has_many :orders

  has_secure_password

  validates_presence_of :first_name, :email

  # def serializable_hash(opts)
  #   super(opts.merge(only: [:id, :username]))
  # end

  
end
