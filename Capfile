# Load DSL and Setup Up Stages
require 'capistrano/setup'

# Includes default deployment tasks
require 'capistrano/deploy'

# Includes tasks from other gems included in your Gemfile
#
# For documentation on these, see for example:
#
#   https://github.com/capistrano/rvm
#   https://github.com/capistrano/rbenv
#   https://github.com/capistrano/chruby
#   https://github.com/capistrano/bundler
#   https://github.com/capistrano/rails
#   https://github.com/bruno-/capistrano-postgresql
#   https://github.com/bruno-/capistrano-safe-deploy-to
#   https://github.com/capistrano/rails
#
 require 'capistrano/rvm'
# require 'capistrano/rbenv'
# require 'capistrano/chruby'
require 'capistrano/bundler'

#require 'capistrano/rails/assets'
#require 'capistrano/rails/migrations'
require 'capistrano/rails'

require 'capistrano/postgresql'
require 'capistrano/safe_deploy_to'
require 'capistrano/sidekiq'

require 'capistrano/puma'
require 'capistrano/puma/workers' #if you want to control the workers (in cluster mode)
require 'capistrano/puma/nginx'   #if you want to upload a nginx site template
# require 'capistrano/puma/jungle'  #if you need the jungle tasks
#require 'capistrano/puma/monit'   #if you need the monit tasks

# Loads custom tasks from `lib/capistrano/tasks' if you have any defined.
Dir.glob('lib/capistrano/tasks/*.rake').each { |r| import r }
