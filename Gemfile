source 'http://rubygems.org'

gem 'rails', '3.2.1'

# add postgre adaptor for heroku
group :production do
  gem 'pg'
end

group :development, :test do
  gem 'sqlite3'
end

gem 'aws-sdk'
gem 'paperclip', :git => 'git://github.com/thoughtbot/paperclip.git'
gem 'rails-settings', :require => 'settings'
gem 'tinymce-rails'
gem 'jquery-rails'
gem 'friendly_id', :git => 'git://github.com/norman/friendly_id.git'
gem 'bcrypt-ruby'

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'
  gem 'uglifier', '>= 1.0.3'
end

# Bundle edge Rails instead:
# gem 'rails', :git => 'git://github.com/rails/rails.git'

# To use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.0.0'

# Bundle gems for the local environment. Make sure to
# put test-only gems in this group so their generators
# and rake tasks are available in development mode:
# group :development, :test do
#   gem 'webrat'
# end
