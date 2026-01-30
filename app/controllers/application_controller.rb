class ApplicationController < ActionController::API
  before_action :authorization_user

  private

  def authorization_user
    header = request.headers["Authorization"]
    token = header.split("").last if header

    decoded = JasonWebToken.decode(token)

    if decoded
      @current_user = User.find(decoded[:user_id])
    else
      render json: { error: "Não Autorizado!" }, status: :unauthorized
    end
  end
end
