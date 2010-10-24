# This file is copied to ~/spec when you run 'ruby script/generate rspec'
# from the project root directory.
ENV["RAILS_ENV"] ||= 'test'
require File.dirname(__FILE__) + "/../config/environment" unless defined?(RAILS_ROOT)
#require 'spec/autorun'
require 'spec/rails'
require 'remarkable_rails'
require 'webrat'
require File.expand_path(File.dirname(__FILE__) + "/example_helper_methods")
require 'faker_additions/init'


Spec::Runner.configure do |config|
  config.use_transactional_fixtures = true
  config.use_instantiated_fixtures  = false
  config.fixture_path = RAILS_ROOT + '/spec/fixtures/'
  config.include Webrat::Matchers, :type => :views
end

# for image testing
require 'action_controller/test_process'
Factory.class_eval do
  def attachment(name, path, content_type = nil)
    path_with_rails_root = "#{RAILS_ROOT}/#{path}"
    uploaded_file = if content_type
                      ActionController::TestUploadedFile.new(path_with_rails_root, content_type)
                    else
                      ActionController::TestUploadedFile.new(path_with_rails_root)
                    end

    add_attribute name, uploaded_file
  end
end
