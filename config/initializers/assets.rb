# Be sure to restart your server when you modify this file.

# Version of your assets, change this if you want to expire all your assets.
Rails.application.config.assets.version = '1.0'

# Add additional assets to the asset load path
# Rails.application.config.assets.paths << Emoji.images_path

# Precompile additional assets.
# application.js, application.css, and all non-JS/CSS in app/assets folder are already added.
# Rails.application.config.assets.precompile += %w( search.js )
Rails.application.config.assets.paths << Rails.root.join("vendor","assets","bower_components","bootstrap-sass-official","fonts")
Rails.application.config.assets.precompile << %r(.*.(?:eot|svg|ttf|woff|woff2)$)
Rails.application.config.assets.precompile += %w( **/*.coffee *.coffee *.css users.js health_items.js health_item_records.js health_item_attentions.js
	medical_record_managements.js take_medicine_managements.js take_medicine_attentions.js welcome.js accounts.js user_focus.js user_vips.js)