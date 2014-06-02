source 'https://rubygems.org'
ruby '2.1.1'
gem 'rails', '4.0.0'
gem 'sass-rails', '~> 4.0.0'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.0.0'
gem 'jquery-rails'
gem 'turbolinks'
gem 'jbuilder', '~> 1.2'
gem 'bootstrap-sass', '>= 3.0.0.0'
gem 'devise'
gem 'redcarpet'
gem 'figaro'
gem 'haml-rails'
gem 'pg'
gem 'simple_form'
gem 'enumerize'
gem 'will_paginate'
gem 'acts_as_relation', '~> 1.0'
gem 'chosen-rails'
gem "ransack", github: "activerecord-hackery/ransack", branch: "rails-4"

group :development do
  gem 'better_errors'
  gem 'binding_of_caller', :platforms=>[:mri_19, :mri_21, :rbx]
  gem 'guard-bundler'
  gem 'guard-rails'
  gem 'guard-rspec'
  gem 'html2haml'
  gem 'quiet_assets'
  gem 'rails_layout'
  gem 'rb-fchange', :require=>false
  gem 'rb-fsevent', :require=>false
  gem 'rb-inotify', :require=>false
end

group :development, :test do
  gem 'factory_girl_rails'
  gem 'rspec-rails'
  gem 'pry-rails'

  gem 'capistrano', '~> 3.0.0'
  gem 'capistrano-rails'
  gem 'capistrano-rvm', '~> 0.1.0'
  gem 'capistrano-nginx'
  gem 'capistrano-bundler'
  gem 'capistrano-puma', github: 'ahmadsherif/capistrano-puma'
end

group :production do
  gem 'puma'
end

group :test do
  gem 'capybara'
  gem 'capybara-webkit'
  gem 'capybara-extensions'
  gem 'database_cleaner', '1.0.1'
  gem 'email_spec'
  gem 'launchy'
end
