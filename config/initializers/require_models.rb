#
# module DevFilesLoader
#   def self.load
#     if Rails.env.development? || Rails.env.test?
#       require_relative 'config'
#       # fetch all of them
#       ['../../../app/models/**/*.rb', '../../../app/observers/**/*.rb', '../../../app/services/**/*.rb'].each do |dir|
#         puts "Loading -> #{dir}"
#         Dir[File.expand_path(dir, __FILE__)].each do |f|
#           require f
#         end
#       end
#     end
#   end
# end
#
# DevFilesLoader.load
