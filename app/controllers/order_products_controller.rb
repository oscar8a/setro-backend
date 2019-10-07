class OrderProductsController < ApplicationController

  def index
    order_products = OrderProduct.all
    render json: order_products, include: ['product']
  end
  
end
