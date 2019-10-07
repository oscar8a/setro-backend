class Order < ApplicationRecord
  belongs_to :users

  has_many :order_products
  # has_many :orders, through: :order_products

  def products
    product = self.order_products.map { |order| order.product_id }
    Product.find(product)
  end

  def user
    user = self.user_id
    User.find(user)
  end

  def date
    date = self.created_at.strftime("%b/%d/%y")
  end

  def time
    time = self.created_at.strftime("%I:%M")
  end

end
