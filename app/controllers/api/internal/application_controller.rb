# frozen_string_literal: true

module Api
  module Internal
    class ApplicationController < ActionController::Base
      acts_as_token_authentication_handler_for User

      respond_to :html
    end
  end
end
