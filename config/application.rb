require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module HealthRecord
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.
    config.active_record.default_timezone = :local
    config.time_zone = 'Beijing'

    config.i18n.default_locale = "zh-CN"
    # config.active_record.raise_in_transactional_callbacks = true
    config.paths.add "app/api", glob: "**/*.rb"
    config.autoload_paths += Dir["#{Rails.root}/app/api/*"]
    config.middleware.use Rack::Cors do
      allow do
        origins "*"
        resource "*", headers: :any, methods: [:get, :post, :put, :delete, :options]
      end
    end

    config.autoload_paths += [
      Rails.root.join('lib')
    ]
    config.eager_load_paths += [
      Rails.root.join('lib/health_record')
    ]

    if Rails.env.development?
      %w( redis).each do |fname|
        filename = "config/#{fname}.yml"
        next if File.exist?(Rails.root.join(filename))
        FileUtils.cp(Rails.root.join("#{filename}.default"), Rails.root.join(filename))
      end
    end
  end
end
