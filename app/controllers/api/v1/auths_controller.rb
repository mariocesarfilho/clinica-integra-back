module Api
  module V1
    class AuthsController < ApplicationController
      def register
        auth_data = AuthService.register(**auths_params.to_h.symbolize_keys)


          render json: { user: auth_data, message: "Usuário criado com sucesso!" }, status: :created
        rescue ArgumentError => e
          render json: { message: e.message }, status: :unprocessable_entity
        rescue ActiveRecord::RecordInvalid => e
          render json: { message: e.record.errors.full_messages }, status: :unprocessable_entity
      end
      private

      def auths_params
        params.require(:user).permit(:username, :email, :cpf, :periodo, :password, :password_confirmation)
      end
    end
  end
end
