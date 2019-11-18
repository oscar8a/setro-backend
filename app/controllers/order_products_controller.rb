class OrderProductsController < ApplicationController
  # skip_before_action :authorized

  def index
    byebug
    order_products = OrderProduct.all
    render json: order_products, include: ['product']
  end

  def create
    order_product = OrderProduct.create(order_product_params)

    if order_product.valid?
      render json: order_product
    else
      render json: { errors: order_product.errors.full_messages }
    end
  end

  def edit
  end

  def update
    order_product = OrderProduct.find_by(order_id: order_product_params[:order_id], product_id: order_product_params[:product_id])

    order_product.update(quantity: order_product_params[:quantity])

    render json: order_product
  end

  def user_order_products
    user = current_user

    
  end

  private
  def order_product_params
    params.permit(:order_id, :product_id, :quantity)
  end
  
end
