require 'devise/async'
Devise::Async.setup do |config|
  config.enabled = Settings.PERFORM_ASYNC
  # Supported options: :resque, :sidekiq, :delayed_job, :queue_classic, :torquebox, :backburner, :que
  config.backend = :sidekiq
  config.queue   = :default
end
