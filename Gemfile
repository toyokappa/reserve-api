source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "3.1.2"

gem "rails", "~> 7.0.4", ">= 7.0.4.2"
gem "mysql2", "~> 0.5"
gem "puma", "~> 5.0"
gem "jbuilder"
gem "bootsnap", require: false
gem "rails-i18n"
gem "enum_help"
gem "carrierwave"
gem "fog-aws"
gem "mini_magick"
gem "slim-rails"

gem "rack-cors"

gem 'seed-fu'
gem "devise_token_auth"
gem "devise-i18n"
gem "devise-i18n-views"
gem "payjp"
gem "rollbar"

group :development, :test do
  gem "annotate"
  gem "pry-rails"
  gem "pry-byebug"
  gem "debug", platforms: %i[ mri mingw x64_mingw ]
end

group :development do
  # Speed up commands on slow machines / big apps [https://github.com/rails/spring]
  # gem "spring"
end

gem "tzinfo-data", platforms: %i[ mingw mswin x64_mingw jruby ]
