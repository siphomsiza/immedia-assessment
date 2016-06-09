
Rails.application.config.active_job.queue_adapter = :sidekiq
Rails.application.config.active_job.queue_name_prefix = $REDIS_CONFIG[:namespace]
Rails.application.config.active_job.queue_name_delimiter = '.'
