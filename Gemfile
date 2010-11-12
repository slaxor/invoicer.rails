source 'http://rubygems.org'
source "http://gems.github.com"
gem 'rails', '3.0.0'
# gem 'rails', :git => 'git://github.com/rails/rails.git'
# gem 'sqlite3-ruby', :require => 'sqlite3'
gem 'mysql'
gem 'unicorn'
gem 'capistrano'
gem 'capistrano-ext'
# gem 'ruby-debug', :group => [:test, :development] unless RUBY_DESCRIPTION.match(/(rubinius|1\.9)/) #rubinius and mri 1.9.x can't do "linecache"
gem 'ruby-debug', :group => [:test, :development], :platforms => :ruby_18
gem 'ruby-debug19', :group => [:test, :development], :platforms => :ruby_19
gem 'json'
gem 'authlogic', :git => 'git://github.com/odorcicd/authlogic.git', :branch => 'rails3'
gem 'haml'
gem 'prawn'
# gem "compass", ">= 0.10.6" #ausprobieren wenn das styling ansteht

group :development do
  gem 'rails3-generators'
  gem 'rspec-rails', '2.0.1'
end

group :test do
  gem 'rspec', '2.0.1'
  gem 'shoulda'
  gem 'factory_girl'
  
  gem 'faker'
  gem 'capybara'
  gem 'database_cleaner'
  # gem 'cucumber-rails'
  # gem 'cucumber'
  # gem 'spork'
  # gem 'launchy'    # So you can do Then show me the page
end

