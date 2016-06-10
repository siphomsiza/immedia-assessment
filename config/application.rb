require File.expand_path('../boot', __FILE__)

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module ImmediaAdmin
  class Application < Rails::Application
    $REDIS_CONFIG =  Rails.application.config_for(:redis)

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    # Set Time.zone default to the specified zone and make Active Record auto-convert to this zone.
    # Run "rake -D time" for a list of tasks for finding time zone names. Default is UTC.
    # config.time_zone = 'Central Time (US & Canada)'
    config.time_zone = Settings.DEFAULT_TIME_ZONE


    # The default locale is :en and all translations from config/locales/*.rb,yml are auto loaded.
    # config.i18n.load_path += Dir[Rails.root.join('my', 'locales', '*.{rb,yml}').to_s]
    # config.i18n.default_locale = :de

    # Do not swallow errors in after_commit/after_rollback callbacks.
    config.active_record.raise_in_transactional_callbacks = true
    config.autoload_paths += Dir[Rails.root.to_s + '/lib/*']
    config.autoload_paths += Dir[Rails.root.to_s + '/app/inputs/*' ]
    config.autoload_paths += Dir[Rails.root.to_s + '/app/observers/*' ]
    config.autoload_paths += Dir[Rails.root.to_s + '/app/uploaders/*' ]
    config.autoload_paths += Dir[Rails.root.to_s + '/app/validators/*' ]
    config.autoload_paths += Dir[Rails.root.to_s + '/app/services/*' ]
    config.autoload_paths += Dir[Rails.root.to_s + '/app/workers/*' ]
    config.autoload_paths += Dir[Rails.root.to_s + '/app/admin/*' ]
    config.autoload_paths += Dir[Rails.root.to_s + '/app/policies/*' ]
    config.autoload_paths += Dir[Rails.root.to_s + '/app/validators/*' ]

    # Do not swallow errors in after_commit/after_rollback callbacks.
    I18n.enforce_available_locales = false
    config.action_view.field_error_proc = Proc.new { |html_tag, instance| "<div class='form-group has-error'>#{html_tag}</div>".html_safe }
    config.generators do |g|
      g.test_framework :rspec
    end
  end
end
