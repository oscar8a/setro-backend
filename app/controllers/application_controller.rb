class ApplicationController < ActionController::API
  before_action :authorized

  def encode_token(payload)
    byebug
    JWT.encode(payload, ENV["JWT_SECRET_KEY"])
  end

  def auth_header
    request.headers['Authorization'] # Bearer <token>
  end

  def decoded_token
    if auth_header()
      token = auth_header.split(' ')[1] #[Bearer, <token>]
      begin
        JWT.decode(token, ENV["JWT_SECRET_KEY"], true, algorithm: 'HS256')
      rescue JWT::DecodeError
        nil
      end
    end
  end

  def current_user
    if decoded_token()
      user_id = decoded_token[0]['user_id']
      @user = User.find_by(id: user_id)
    else
      nil
    end
  end

  def logged_in?
    !!current_user
  end

  def authorized
    render json: { errors: 'PLEASE LOG IN' }, status: :unauthorized unless logged_in?
  end
end
# def authorized?(user_id)
  #   token = try_get_token
  #   return token.present? && token['user_id'] == user_id.to_i
  # end

  # def authenticated?
  #   try_get_token.present?
  # end
  # eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoxfQ.ETUYUOkmfnWsWIvA8iBOkE2s1ZQ0V_zgnG_c4QRrhbg
  # private
  # def try_get_token
  #   token = request.headers["Authorization"]

  #   if token.present?
  #     begin
  #       decoded_token = JWT.decode(token, ENV["JWT_SECRET_KEY"], true, { algorithm: 'HS256'})
  #     rescue JWT::VerificationError
  #       return nil
  #     end
  #     return decoded_token.first
  #   else
  #     nil
  #   end
  # end