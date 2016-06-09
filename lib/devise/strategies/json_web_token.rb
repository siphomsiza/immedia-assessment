require 'jwt'
require 'devise'
require 'devise/strategies/authenticatable'
require_relative '../models/jwt'
module Devise
  module Models
    module JsonWebToken
      extend ActiveSupport::Concern
    end
  end

  module Strategies
    class JsonWebToken < ::Devise::Strategies::Authenticatable
      class Encoder
        class << self
          def encode(payload, exp = Settings.DEVISE_JWT_EXPIRY)
            payload[:exp] = exp.to_i.seconds.from_now.to_i
            JWT.encode(payload, Rails.application.secrets.secret_key_base)
          end

          def decode(token)
            body = JWT.decode(token, Rails.application.secrets.secret_key_base)[0]
            HashWithIndifferentAccess.new body
          rescue
            # we don't need to trow errors, just return nil if JWT is invalid or expired
            nil
          end
        end
      end

      def valid?
        request.headers['Authorization'].present? || request.params['auth_token'].present?
      end

      def authenticate!
        data = claims
        if data.present? && user = ::User.find_by_id(data['user_id'])
          success! user
        else
          fail!
        end
      end


      # override base class implementation
      # allow for Rails application to configure
      # skipping session storage for jwt requests
      # see Devise skip_session_storage configuration
      def authentication_type
        :json_web_token
      end

      # override base class implementation
      # API requests should *not* reset the user's
      # CSRF token which triggers rails to set the
      # session_id key and send cookies to users
      def clean_up_csrf?
        false
      end

      private

      def claims
        token = (request.headers['Authorization'] || request.params['auth_token']) and
        token = token.split(' ').last and
        Encoder.decode(token)
      rescue
        nil
      end
    end
  end
end


Warden::Strategies.add(:json_web_token, Devise::Strategies::JsonWebToken)
Devise.add_module(:json_web_token, strategy: true, model: 'devise/models/json_web_token')
