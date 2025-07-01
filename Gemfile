source "https://rubygems.org"

ruby file: ".tool-versions"

gem "rails"
gem "propshaft"
gem "sqlite3", ">= 2.1"
gem "puma", ">= 5.0"
gem "importmap-rails"
gem "turbo-rails"
gem "stimulus-rails"
gem "cssbundling-rails"
gem "jbuilder"
gem "bcrypt", "~> 3.1.7"

gem "tzinfo-data", platforms: %i[windows jruby]

gem "solid_cache"
gem "solid_queue"
gem "solid_cable"

gem "bootsnap", require: false
gem "kamal", require: false
gem "thruster", require: false

# gem "image_processing", "~> 1.2"

group :development, :test do
  gem "debug", platforms: %i[mri windows], require: "debug/prelude"
  gem "brakeman", require: false
  gem "rubocop-lazy-config",
    github: "jethrodaniel/rubocop-lazy-config",
    require: false
end

group :development do
  gem "web-console"
end

group :test do
  gem "capybara"
  gem "selenium-webdriver"
end

gem "ruby_llm"
gem "sqlite_extensions-uuid",
  github: "jethrodaniel/sqlite_extensions-uuid",
  branch: "dev"
