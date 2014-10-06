source 'https://rubygems.org'

gem 'rails', '4.1.6'

gem 'therubyracer',  platforms: :ruby
gem 'less-rails' # Si no está aqui, el rake assets:precompile RAILS_ENV=production falla
gem 'twitter-bootstrap-rails'

gem 'jquery-rails'
gem 'turbolinks'
gem 'jbuilder', '~> 2.0'

gem 'haml'
gem 'haml-rails'

gem 'devise'

group :development do
  gem 'uglifier', '>= 1.3.0'
  gem 'sqlite3'
  gem 'spring' #,        group: :development
end

group :test do
  gem "rspec-rails"
  gem "cucumber-rails"
  gem "capybara"
  gem "capybara-webkit"
  gem "database_cleaner"
end

group :production do
  gem 'mysql2'
end
