#coding: utf-8
require File.expand_path('../boot', __FILE__)

require 'rails/all'

# If you have a Gemfile, require the gems listed there, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(:default, Rails.env) if defined?(Bundler)
I18n.default_locale = :de

Time::DATE_FORMATS[:german_date] = '%d.%m.%Y'
Time::DATE_FORMATS[:month_stamp] = '%Y%m'
Time::DATE_FORMATS[:medium] = '%d.%m.%Y %H:%M'
Mime::Type.register("text/plain", :tex)
#Mime::Type.register("application/pdf", :pdf)
silence_warnings do
  ActionView::Helpers::NumberHelper::DEFAULT_CURRENCY_VALUES = {
    :format => "%n %u", :unit => "€", :separator => ",", :delimiter => " ",
    :precision => 2, :significant => false, :strip_insignificant_zeros => false
  }
end

ActiveRecord::Base.include_root_in_json = false

module InvoicerRails
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    # Add additional load paths for your own custom dirs
    # config.load_paths += %W( #{config.root}/extras )

    # Only load the plugins named here, in the order given (default is alphabetical).
    # :all can be used as a placeholder for all plugins not explicitly named
    # config.plugins = [ :exception_notification, :ssl_requirement, :all ]

    # Activate observers that should always be running
    # config.active_record.observers = :cacher, :garbage_collector, :forum_observer

    # Set Time.zone default to the specified zone and make Active Record auto-convert to this zone.
    # Run "rake -D time" for a list of tasks for finding time zone names. Default is UTC.
    # config.time_zone = 'Central Time (US & Canada)'

    # The default locale is :en and all translations from config/locales/*.rb,yml are auto loaded.
    # config.i18n.load_path += Dir[Rails.root.join('my', 'locales', '*.{rb,yml}').to_s]
    # config.i18n.default_locale = :de

    # Configure generators values. Many other options are available, be sure to check the documentation.
    # config.generators do |g|
    #   g.orm             :active_record
    #   g.template_engine :erb
    #   g.test_framework  :test_unit, :fixture => true
    # end
    config.generators do |g|
      g.orm             :active_record
      g.template_engine :haml
      # g.test_framework  :rspec, :fixture => false, :views => false
      # g.fixture_replacement :factory_girl, :dir => "spec/factories"
      g.test_framework  :rspec, :fixture => true, :views => false
      g.fixture_replacement :factory_girl, :dir => "spec/factories"
      # g.fallbacks[:shoulda] = :test_unit
    end
    
    # Configure the default encoding used in templates for Ruby 1.9.
    config.encoding = "utf-8"

    # Configure sensitive parameters which will be filtered from the log file.
    config.filter_parameters += [:password, :password_confirmation]
  end
end
