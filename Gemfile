source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.2.1'

gem 'rails', '~> 7.0.4', '>= 7.0.4.2'
gem 'multi_json'
gem 'puma', '~> 5.0'
gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]
gem 'bootsnap', require: false

gem 'pg'
gem 'memoist'
gem 'representable'

group :development, :test do
  gem 'debug', platforms: %i[ mri mingw x64_mingw ]
end

group :test do
  gem 'rspec'
  gem 'rspec-rails'
  gem 'saharspec'
  gem 'database_cleaner'
  gem 'factory_bot_rails'
  gem 'faker'
  gem 'rspec-its'
end

