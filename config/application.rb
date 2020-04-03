require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Showoff
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 6.0
    ENV['RECAPTCHA_SITE_KEY']   = Rails.application.credentials.recaptcha[:site_key]
    ENV['RECAPTCHA_SECRET_KEY'] = Rails.application.credentials.recaptcha[:secret_key]
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.
  end
end
