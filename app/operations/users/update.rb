# frozen_string_literal: true

module Users
  class Update < ::Callable
    def initialize(user:, **params)
      @user        = user
      @user_params = params.fetch(:user_params, {})
    end

    def call
      user.update(user_params)
    end

    private

    attr_reader :user_params, :user
  end
end
