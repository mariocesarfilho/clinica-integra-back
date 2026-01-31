class SessionsController < ApplicationController
  skip_before_action :authorization_user, :only [:login]

  def login
    user = User.find_by(email: params[:email])

    if user&.authenticate(params[:password])
      token = JasonWebToken.encode(user_id: user.id)
      render json: { token: token }, status: :ok
    else
      render json: { error: "Credenciais Inválidas" }, status: :unauthorized
    end
  end

  def logout
    render json: { message: "Logout realizado com sucesso! " }, status: :ok
  end
end
