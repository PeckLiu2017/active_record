require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module ActiveRecord
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.
     ActiveRecord::Base.lock_optimistically = false
     config.time_zone = "Beijing"
    #  config.middleware.delete Rack::Runtime
    # config.middleware.insert_after ActionDispatch::Executor, Lifo::Cache, page_cache: false
    # config.middleware.use Rack::BounceFavicon
  end
end
