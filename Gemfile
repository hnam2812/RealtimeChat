source "https://rubygems.org"

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

gem "rails", "~> 5.0.2"

gem "devise"
gem "mysql2", "0.3.21"
gem "puma", "~> 3.0"

gem "sass-rails", "~> 5.0"

gem 'bootstrap-sass', '~> 3.3.6'

gem "coffee-rails", "~> 4.2"

gem "jquery-rails"

gem "carrierwave"

gem "ransack"

gem "material_icons"

gem "ransack"

group :development, :test do
  gem "pry-rails"
  gem "faker"
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> anywhere in the code.
  gem "web-console", ">= 3.3.0"
  gem "listen", "~> 3.0.5"
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem "spring"
  gem "spring-watcher-listen", "~> 2.0.0"
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem "tzinfo-data", platforms: [:mingw, :mswin, :x64_mingw, :jruby]
