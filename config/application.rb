# frozen_string_literal: true

require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

# Load dotenv only in development or test environment
Dotenv::Railtie.load if %w[development test].include?(ENV['RAILS_ENV'])

module MyExpenses
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 7.0

    config.middleware.use OmniAuth::Builder do
      if ENV['OAUTH_GOOGLE_KEY']
        provider :google_oauth2, ENV['OAUTH_GOOGLE_KEY'], ENV.fetch('OAUTH_GOOGLE_SECRET', nil)
      end
    end

    paths = []
    Rails.root.glob('packs/*/lib').each do |file|
      if File.directory?(file)
        paths << file
      end

      file = "#{file}/public"
      if File.directory?(file)
        paths << file
      end
    end

    config.autoload_paths += paths

    # config.autoload_paths += Dir

    # Configuration for the application, engines, and railties goes here.
    #
    # These settings can be overridden in specific environments using the files
    # in config/environments, which are processed later.
    #
    # config.time_zone = "Central Time (US & Canada)"
    # config.eager_load_paths << Rails.root.join("extras")
    config.generators do |generate|
      generate.helper false
      generate.assets false
      generate.view_specs false
      generate.fixture_replacement :fabrication, dir: 'spec/fabricators'
    end
  end
end
