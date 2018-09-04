# frozen_string_literal: true

module Api
  module V1
    class UserSerializer
      include FastJsonapi::ObjectSerializer

      attributes :id, :username, :email
    end
  end
end
