module Api
  module V1
    class AuthsController < ApplicationController
      def create
        # auth_data = Users::AuthService.new(**auths_params.to_h.symbolize_keys).call
        auth_data = Users::AuthService.new(auths_params).call

        render json: { user: auth_data, message: "Usuário criado com sucesso!" }, status: :created
      rescue ArgumentError => e
        render json: { message: e.message }, status: :unprocessable_entity
      rescue ActiveRecord::RecordInvalid => e
          render json: { message: e.record.errors.full_messages }, status: :unprocessable_entity
      end

      private

      def auths_params
        # params.expect(user: [ :username, :email, :cpf, :periodo, :password, :password_confirmation ])
        params.require(:user).permit(:username, :email, :cpf, :periodo, :password, :password_confirmation)
      end
    end
  end
end
