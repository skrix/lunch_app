# frozen_string_literal: true

module Operations
  module Users
    class Create < ::Callable
      def initialize(params = {})
        @email    = params[:email]
        @password = params[:password]
      end

      def call
        User.create(creation_params)
      end

      private

      attr_reader :email, :password

      def creation_params
        { email: email, password: password }
      end
    end
  end
end
