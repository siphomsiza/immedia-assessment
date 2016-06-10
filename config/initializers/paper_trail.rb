# the following line is required for PaperTrail >= 4.0.0 with Rails
PaperTrail.config.track_associations = false
require 'paper_trail/frameworks/active_record/models/paper_trail/version_association'
require 'paper_trail/frameworks/active_record/models/paper_trail/version'
require "paper_trail"

PaperTrail::Rails::Engine.eager_load!

if defined?(::Rails::Console)
  PaperTrail.whodunnit = "#{`whoami`.strip}: console"
elsif File.basename($0) == "rake"
  PaperTrail.whodunnit = "#{`whoami`.strip}: rake #{ARGV.join ' '}"
end
