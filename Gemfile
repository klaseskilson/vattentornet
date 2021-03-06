source 'https://rubygems.org'
# set ruby version
ruby '2.3.1'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.2.7.1'
# Use postgresql as the database for Active Record
gem 'pg'

# Use SCSS for stylesheets
gem 'sass-rails', '~> 5'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .js.coffee assets and views
gem 'coffee-rails', '~> 4.1.1'
# See https://github.com/sstephenson/execjs#readme for more supported runtimes
# gem 'therubyracer',  platforms: :ruby

# User handling
gem 'devise', '~> 3'
# User level authentication
gem 'cancan'

# nice, pretty urls
gem 'friendly_id', '~> 5.1.0'

# Use jquery as the JavaScript library
gem 'jquery-rails'
# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'
# make sure events jquery rely on works
gem 'jquery-turbolinks'
# add loading indicator to turbolinks events
gem 'nprogress-rails'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.0'
# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 0.4.0', group: :doc
# angular es nice
gem 'angularjs-rails'
gem 'angular-ui-bootstrap-rails'

# moment.js
gem 'momentjs-rails'

# css related stuff
gem 'bootstrap-sass', '~> 3'
# icons!
gem 'font-awesome-sass'
# neat toolkit for bourbon
gem 'bourbon'
# add vendor prefixes without hassle
gem 'autoprefixer-rails'

# Add new relic apm
gem 'newrelic_rpm'

# render pages and news with github flavored markdown
gem 'github-markdown', '~> 0.6'

# BEEEEEER
gem 'brewery_db', '~> 0.2.4'

# Pagination gem
gem 'will_paginate'

# Use Puma as the app server
gem 'puma'

gem 'minitest-happy'

group :development do
  gem 'byebug'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  # Opens mails in browser
  gem 'letter_opener_web', '~> 1.2.0'
  # add a rails console to the error pages
  gem 'web-console', '~> 3.0'
  # replaces the standard Rails error page with a much better and more useful error page
  gem 'better_errors'
  # handle secrets secretly and simple
  gem 'figaro'
  # ci tools
  gem 'brakeman', require: false
  gem 'rubocop', require: false
  gem 'coveralls', require: false
end

group :production do
  # heroku wants this to be here
  gem 'rails_12factor'
  # gzip them assets
  gem 'heroku-deflater'
  # minify dat html
  gem 'htmlcompressor'
end
