class OrdersController < ApplicationController
  # skip_before_action :authorized

  def index
    
      orders = Order.all.order(created_at: :desc)
      render json: orders
      
      # , methods: [:products, :user, :date, :time], :except => [:created_at, :updated_at]


    # else 
    #   render json: { errors: 'product.errors.full_messages' }
    # end
  end 

  def user_cart
    user = current_user
    cart = Order.all.find_by(:user_id => user.id, :status => false)
    
    if cart.valid?
      render json: cart
    else
      # @order = Order.new(user_id: order_params[:user_id], status: false, date: nil)
      # cartOrder = Order.create(@order)

      # render json: cartOrder
      render json: { errors: cart.errors.full_messages }
    end
  end

  def show
    order = Order.find(order_params[:id])

    render json: order
  end

  def create 
  #   order = Order.create(order_params)
  #   render json: order
  end

  def user_orders
    user = current_user
    myorders = Order.all.select {|order| order.user_id == user.id } 

    render json: myorders
  end

  private
  def order_params
    params.permit(:id, :user_id, :status, :date)
  end
end