require "jwt"

module Users
  class AuthService
    def initialize(username:, email:, cpf:, periodo:, password:, password_confirmation:)
      @username = username
      @email = email
      @cpf = cpf
      @periodo = periodo
      @password = password
      @password_confirmation = password_confirmation
    end

    def call
      register
    end
    private

    def register
       user = User.create! ({
        username: @username,
        email: @email,
        cpf: @cpf,
        periodo: @periodo,
        password: @password,
        password_confirmation: @password_confirmation
      })

      payload = { user_id: user.id }
      secret_key = Rails.application.credentials.secret_key_base

      token = JWT.encode(payload, secret_key, "HS256")

      {
        user_id: user.id,
        token: token
      }
    end
  end
end
