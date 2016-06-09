require 'devise'
require Rails.root.to_s + '/lib/devise/strategies/json_web_token'

# setting up JsonWebToken Authentication
Devise.setup do |config|
    # ==> Warden configuration
    # If you want to use other strategies, that are not supported by Devise, or
    # change the failure app, you can configure them inside the config.warden block.
    #
    # config.warden do |manager|
    #   manager.intercept_401 = false
    #   manager.default_strategies(scope: :user).unshift :some_external_strategy
    # end
    config.warden do |manager|
      manager.strategies.add(:json_web_token, ::Devise::Strategies::JsonWebToken)
      manager.default_strategies(scope: :user).unshift :json_web_token
    end

    # By default Devise will store the user in session. You can skip storage for
    # particular strategies by setting this option.
    # Notice that if you are skipping storage for all authentication paths, you
    # may want to disable generating routes to Devise's sessions controller by
    # passing skip: :sessions to `devise_for` in your config/routes.rb

    # Most API's should not create sessions for each API request
    config.skip_session_storage ||= [:http_auth] # this is the default devise config
    config.skip_session_storage << :json_web_token
end
