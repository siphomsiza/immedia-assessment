# Be sure to restart your server when you modify this file.

# Version of your assets, change this if you want to expire all your assets.
Rails.application.config.assets.version = '1.0'

# Add additional assets to the asset load path
# Rails.application.config.assets.paths << Emoji.images_path
Rails.application.config.assets.paths << Rails.root.to_s  + "/vendor/assets/color_admin"
Rails.application.config.assets.paths << Rails.root.to_s  + "/vendor/assets/fonts"

# Precompile additional assets.
# application.js, application.css, and all non-JS/CSS in app/assets folder are already added.
# Rails.application.config.assets.precompile += %w( search.js )
Rails.application.config.assets.precompile += %w(core.js ie.lt9.js plugins/pace/pace.min.js color_admin_page_level.js ra.js)
