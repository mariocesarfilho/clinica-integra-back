require "ostruct"
module Users
  class AuthService
    def self.create(user_params)
      user = User.new(user_params)
      if user.save
        token = JasonWebToken.encode(user_id: user.id)

        OpenStruct.new(
        success?: true,
        user: user,
        token: token
        )
      else
        OpenStruct.new(
          success?: false,
          errors: user.errors.full_messages
        )
      end
    end
  end
end
