source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "3.3.4"

gem "activerecord-postgres_enum"
gem "aws-sdk-s3", require: false
gem "awesome_print"
gem "bootsnap", require: false
gem "binding_of_caller"
gem "bundler-audit"
gem "devise"
gem "dotenv-rails"
gem "htmlbeautifier"
gem "http"
gem "importmap-rails"
gem "jbuilder"
gem "kaminari"
gem "mutex_m" # I dont know what this does, but I was getting an error message about it
gem "pg"
gem "puma", "~> 5.0"
gem "pundit"
gem "rails", "~> 7.0.8", ">= 7.0.8.4"
gem "ransack"
gem "sprockets-rails"
gem "stimulus-rails"
gem "table_print"
gem "turbo-rails"
gem "tzinfo-data", platforms: %i[mingw mswin x64_mingw jruby]

group :development, :test do
  gem "debug", platforms: %i[mri mingw x64_mingw]
  gem "rspec-rails", "~> 6.0.0"
end

group :development do
  gem "annotate"
  gem "better_errors"
  gem "brakeman"
  gem "faker"
  gem "pry-rails"
  gem "rails_db"
  gem "rubocop-rails", require: false
  gem "rubocop-rails_config"
  gem "specs_to_readme"
  gem "web-console"
end

group :test do
  gem "capybara"
  gem "rspec-html-matchers"
  gem "selenium-webdriver"
  gem "webdrivers"
  gem "webmock"
end
