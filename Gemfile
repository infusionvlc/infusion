source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end


gem 'rails', '~> 5.1.5'
gem 'pg', "~> 0.18"
gem 'puma'
gem 'sass-rails'
gem 'uglifier'


gem 'coffee-rails'
gem 'turbolinks'
gem 'jbuilder'


gem 'bootstrap'
gem 'font-awesome-rails'
gem 'high_voltage'
gem 'jquery-rails'
gem 'kaminari'
gem 'bootstrap4-kaminari-views'

gem 'cocoon'
gem 'bcrypt', git: 'https://github.com/codahale/bcrypt-ruby.git', :require => 'bcrypt'
gem 'devise', git: 'https://github.com/plataformatec/devise'
gem 'omniauth'
gem 'omniauth-github'
gem 'omniauth-twitter'
gem 'omniauth-facebook'
gem 'omniauth-google-oauth2'
gem 'pundit'

gem 'aws-sdk'
gem 'paperclip'

gem 'awesome_print', require: 'ap'

gem 'devise-i18n'

gem 'redcarpet'
#gem 'showdown-rails'

group :development, :test do
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'capybara'
  gem 'selenium-webdriver'

  gem 'rubocop', require: false
  gem 'simplecov', :require => false
end

group :development do
  gem 'web-console'
  gem 'rails_real_favicon'

  gem 'guard'
  gem 'guard-minitest'
end

gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
