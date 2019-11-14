class UsersController < ApplicationController
  skip_before_action :authorized, only: [:create]

  def index
    # if authenticated?
    users = User.all
    render json: users
    # else
    #   render :json => { go_away: true }, :status => :unauthorized
    # end
  end
  
  def profile
    render json: { user: UserSerializer.new(current_user) }, status: :accepted
  end

  def show
    user_id = params[:id]

    # if authorized?(user_id)  
      user = User.find(params[:id])
      render json: user
    # else 
    #   render :json => { go_away: true }, :status => :unauthorized
    # end
  end

  def edit
  end

  def update
    user = User.find_by(email: user_params[:email])

    if user.update(user_params)
      render json: user
    else
      render json: { errors: user.errors.full_messages }
    end
  end

  def create 
    user = User.create(user_params)
    user.create_cart
    
    if user.valid?
      token = encode_token(user_id: user.id)
          #   token = JWT.encode({ user_id: user.id }, ENV["JWT_SECRET_KEY"], 'HS256' )
      render json: { user: user, token: token }, status: :created
    else
      render json: { errors: user.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def destroy
    user = User.find(params[:id])
    user.destroy

    render json: {worked: true}
  end

  private
  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :phone, :street, :city, :state, :zipcode)
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