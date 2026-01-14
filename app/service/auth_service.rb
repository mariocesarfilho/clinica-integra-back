require "jwt"

class AuthService
  def self.register(username:, email:, cpf:, periodo:, password:, password_confirmation:)
    if password != password_confirmation
        raise ArgumentError, "Senhas incompatíveis"
    end

    user = User.create({
      username: username,
      email: email,
      cpf: cpf,
      periodo: periodo,
      password: password,
      password_confirmation: password_confirmation
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
