# frozen_string_literal: true

module Operations
  module Users
    class Update < ::Callable
      def initialize(params = {})
        @user        = params[:user]
        @user_params = params[:user_params]
      end

      def call
        user&.update(update_params)
      end

      private

      attr_reader :user_params, :user

      def update_params
        user_params.slice(:hidden)
      end
    end
  end
end
