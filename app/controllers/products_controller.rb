class ProductsController < ApplicationController
  #before_action :set_product, only: [:show]


  def index
    products = Product.all
    render json: products
  end

  def show
    # sighting = Sighting.find_by(id: params[:id])
    # render json: { id: sighting.id, bird: sighting.bird, location: sighting.location }

    product = Product.find_by(id: params[:id])

    if product
      render json: product
    else
      render json: { errors: 'No product found with that id' }
    end
  end
  
  private

  # def set_product
  #   @product = Product.find_by(params[:id])
  # end

  # def product_params
  #   params.permit(:id, :common_name, :availability, :price)
  # end
    
end
