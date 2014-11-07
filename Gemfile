source 'https://rubygems.org'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.1.4'
# Use sqlite3 as the database for Active Record
# Use SCSS for stylesheets
gem 'sass-rails', '~> 4.0.3'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .js.coffee assets and views
gem 'coffee-rails', '~> 4.0.0'
# See https://github.com/sstephenson/execjs#readme for more supported runtimes
# gem 'therubyracer',  platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.0'
# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 0.4.0',          group: :doc

# Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
gem 'spring',        group: :development

gem 'devise'
gem 'simple_form'

gem "bootstrap-sass", "~> 3.2.0"
gem "autoprefixer-rails"
gem "font-awesome-rails"
gem "underscore-rails"
gem "rubyzip"
gem "rack-cache"
gem "dalli"
gem "kgio"
gem "memcachier"
gem "protected_attributes"
gem "rails_12factor"
gem "haml-rails"
gem "therubyracer"
group :development, :test do
  gem "debugger"
  gem "sqlite3"
  gem "rspec-rails", "~> 3.0.0.beta"
  gem "pry"
  gem "thin"
end

group :test do
  gem "shoulda-matchers"
  gem "webmock"
  gem "simplecov", require: false
  gem "factory_girl_rails"
end

group :production do
  gem "pg"
  gem "unicorn"
  gem "heroku-deflater"
end

# Ruby version
ruby '2.0.0'
