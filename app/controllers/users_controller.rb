class UsersController < ApplicationController

  def index
    if authenticated?
      users = User.all
      render json: users
    else
      render :json => { go_away: true }, :status => :unauthorized
    end
  end

  def show
    user_id = params[:id]

    if authorized?(user_id)  
      user = User.find(params[:id])
      render json: user
    else 
      render :json => { go_away: true }, :status => :unauthorized
    end
  end

  # def new
  #   user = User.new(user_params)

  #   if user.save
  #       render json: user
  #   else
  #       render json: {errors: user.errors}
  #   end
  # end

  def create 
    user = User.create(user_params)

    if user.valid?
      token = JWT.encode({ user_id: user.id }, ENV["JWT_SECRET_KEY"], 'HS256' )
      render json: { token: token, username: user.first_name }
    else
      render json: {errors: user.errors.full_messages}
    end
  end

  def destroy
    user = User.find(params[:id])
    user.destroy

    render json: {worked: true}
  end

  private
  def user_params
    params.permit(:first_name, :last_name, :email, :password, :phone, :street, :city, :state, :zipcode)
  end

  def authenticated?
    token = request.headers["Authorization"]

    if token.present?
      begin
        decoded_token = JWT.decode(token, ENV["JWT_SECRET_KEY"], true, { algorithm: 'HS256' })
      rescue JWT::VerificationError
        return false
      end
      return true
    else
      false
    end
  end

end
