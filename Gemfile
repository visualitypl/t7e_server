source 'https://rubygems.org'

gem 'rails', '4.2.0.rc1'
gem 'mysql2'
gem 'pg'
gem 'sass-rails', '~> 4.0'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.1.0'
gem 'jquery-rails'
gem 'jbuilder', '~> 2.0'
gem 'sdoc', '~> 0.4.0', group: :doc

gem 'haml'
gem 'haml-rails'
gem 'simple_form'
gem 'devise'
gem 'factory_girl_rails', :require => false
gem 'minitest'
gem 'faker'
gem 'bourbon'
gem 'bootstrap-sass', '~> 3.2.0'
gem 'autoprefixer-rails'
gem 'font-awesome-sass'
gem 'cancancan'
gem 'devise_invitable'

group :development, :test do
  # gem 'better_errors'
  gem 'binding_of_caller'
  # gem 'byebug'
  gem 'web-console', '~> 2.0'
  gem 'spring'
  gem 'rspec'
  gem 'rspec-rails'
end
group :heroku, :production do
  gem 'rails_12factor', require: !!ENV["HEROKU"]
end