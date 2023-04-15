# Be sure to restart your server when you modify this file.

# Version of your assets, change this if you want to expire all your assets.
Rails.application.config.assets.version = '1.0'

# Add additional assets to the asset load path.
# Rails.application.config.assets.paths << Emoji.images_path
# Add Yarn node_modules folder to the asset load path.
Rails.application.config.assets.paths << Rails.root.join('node_modules')

# Precompile additional assets.
# application.js, application.css, and all non-JS/CSS in the app/assets
# folder are already added.
# Rails.application.config.assets.precompile += %w( admin.js admin.css )
# Rails.application.config.assets.precompile += %w( *.png *.jpg *.jpeg *.gif svg/*.svg )
# Add email styles (these are compiled using the asset pipeline so they can be accessed with stylesheet_link_tag)

# As of August 2022, each of these files needs to be mentioned in dartsass.rb so the new Dart Sass gem will compile them. Failure to do so will throw an error
# as Sprockets defaults to using Libsass/SassC (the old Sass library which our stylesheets are not backwards compatible with), unless explicitly told otherwise
Rails.application.config.assets.precompile += [
  "main.css"
]