class OrdersController < ApplicationController

  def index
    #if logged_in_user.admin?
      orders = Order.all.order(created_at: :desc)
      render json: orders, methods: [:products, :user, :date, :time], :except => [:created_at, :updated_at]
    # else 
    #   render json: { errors: 'product.errors.full_messages' }
    # end
  end 
  

end
