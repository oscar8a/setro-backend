class OrdersController < ApplicationController
  skip_before_action :authorized
  def index
    #if logged_in_user.admin?
      orders = Order.all.order(created_at: :desc)
      render json: orders, methods: [:products, :user, :date, :time], :except => [:created_at, :updated_at]
    # else 
    #   render json: { errors: 'product.errors.full_messages' }
    # end
  end 

  def create 
    order = Order.create(order_params)

    render json: order
  end

  private
  def order_params
    params.require(:order).permit(:user_id, :status, :date)
  end
  

end
