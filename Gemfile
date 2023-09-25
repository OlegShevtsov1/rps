source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.7.1'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 6.0.3', '>= 6.0.3.4'
# Use postgresql as the database for Active Record
gem 'pg', '>= 0.18', '< 2.0'
# Use Puma as the app server
gem 'puma', '~> 4.1'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
# gem 'jbuilder', '~> 2.7'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 4.0'
# Use Active Model has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Active Storage variant
# gem 'image_processing', '~> 1.2'

# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', '>= 1.4.2', require: false

# Use Rack CORS for handling Cross-Origin Resource Sharing (CORS), making cross-origin AJAX possible
# gem 'rack-cors'
gem 'rswag-api', '2.10.1'
gem 'rswag-ui', '2.10.1'

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: %i[mri mingw x64_mingw]
  gem 'factory_bot_rails', '6.1.0'
  gem 'ffaker', '2.17.0'
  gem 'pry', '0.13.1'
  gem 'pry-rails', '0.3.9'
  gem 'rails-controller-testing', '1.0.5'
  gem 'rspec_junit_formatter', '0.4.1'
  gem 'rspec-rails', '~> 3.6'
  gem 'rswag-specs', '2.10.1'
  gem 'rubocop', '1.56.3'
  gem 'rubocop-performance', '1.19.1'
  gem 'rubocop-rails', '2.21.1'
  gem 'rubocop-rspec', '2.24.1'
  gem 'shoulda-matchers', '4.4.1'
end

group :development do
  gem 'brakeman', '4.9.0'
  gem 'bullet', '6.1.0'
  gem 'bundler-audit', '0.7.0.1'
  gem 'database_consistency', '0.8.4', require: false
  gem 'fasterer', '~> 0.8.3', require: false
  gem 'listen', '~> 3.2'
  gem 'overcommit', '~> 0.53.0', require: false
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

group :test do
  gem 'simplecov', '0.19.0', require: false
end
