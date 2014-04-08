require File.expand_path('../boot', __FILE__)

# Pick the frameworks you want:
require "active_record/railtie"
require "action_controller/railtie"
require "action_mailer/railtie"
require "sprockets/railtie"
# require "rails/test_unit/railtie"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(:default, Rails.env)

module Starrzdance
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    # Set Time.zone default to the specified zone and make Active Record auto-convert to this zone.
    # Run "rake -D time" for a list of tasks for finding time zone names. Default is UTC.
    # config.time_zone = 'Central Time (US & Canada)'

    # The default locale is :en and all translations from config/locales/*.rb,yml are auto loaded.
    # config.i18n.load_path += Dir[Rails.root.join('my', 'locales', '*.{rb,yml}').to_s]
    # config.i18n.default_locale = :de
    config.assets.precompile += %w{*.png *.jpg *.jpeg *.gif}
    config.assets.precompile += %w( video-js.swf vjs.eot vjs.svg vjs.ttf vjs.woff )
    config.assets.precompile += %w{*.mp4}
    config.assets.precompile += %w( gallery/gallery.js gallery/jquery.easing.1.3.js 
                                    gallery/jquery.elastislide.js gallery/jquery.tmpl.min.js
                                    photo_slider/elastislide.css photo_slider/style.css )

    config.assets.precompile += %w( fancybox/jquery.fancybox.pack.js fancybox/jquery.mousewheel-3.0.6.pack.js
                                    jquery.fancybox.css)

    config.assets.precompile += %w( static_pages/photo.css)

    #config.assets.precompile += %w( photo_slider/ajax-loader.gif photo_slider/black.png photo_slider/nav.png
    #                                photo_slider/nav_thumbs.png photo_slider/views.png)
    

    config.assets.paths << Rails.root.join("app", "assets", "fonts")
  end
end