# frozen_string_literal: true

module Api
  module V1
    class UsersController < ApiController
      before_action :set_user, only: %i[show edit update destroy]
      respond_to :json

      def index
        render json: users
      end

      def update
        return render :show if update_user

        respond_with_errors(@user)
      end

      private

      def set_user
        @user = User.find(params[:id])
      end

      def user_params
        params.require(:user).permit(:email, :password)
      end

      def update_user
        Operations::Users::Update.call(
          user:        @user,
          user_params: user_params
        )
      end

      def users
        @users = User.all
      end
    end
  end
end
