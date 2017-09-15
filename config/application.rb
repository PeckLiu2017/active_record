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
     config.i18n.default_locale = 'cn'
    #  config.middleware.delete Rack::Runtime
    # config.middleware.insert_after ActionDispatch::Executor, Lifo::Cache, page_cache: false
    # config.middleware.use Rack::BounceFavicon

    config.generators do |g|
      g.orm             :active_record
      g.template_engine :erb
      g.test_framework  :test_unit, fixture: false
      g.scaffold_stylesheet false
      g.stylesheets     false
      g.javascripts     false
      # g.helper          :my_helper
    end
  end
end
