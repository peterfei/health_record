source 'https://ruby.taobao.org'


# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.0.0', '>= 5.0.0.1'
# Use sqlite3 as the database for Active Record
gem 'mysql2'
# Use Puma as the app server
gem 'puma', '~> 3.0'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.2'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks', '~> 5'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.5'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 3.0'
# Use ActiveModel has_secure_password
gem 'bcrypt', '~> 3.1.7'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

#断点
gem 'pry'
gem 'pry-nav'

#搜索
gem 'ransack'

#分页
gem 'kaminari'

#接口相关
gem 'grape'
gem 'grape-entity'
gem 'grape-kaminari',git:'https://github.com/monterail/grape-kaminari.git' #分页
gem 'grape-raketasks'

#标签
gem 'acts-as-taggable-on', '~> 4.0'
gem 'rails-settings-cached'

#跨域
gem 'rack-cors'

#devise
gem 'devise'

#面包屑
gem "breadcrumbs_on_rails"

#搜索
gem 'ransack'

#select2
gem "select2-rails"

#带时间日历bootstrap3-datetimepicker-rails
gem 'momentjs-rails', '>= 2.9.0'
gem 'bootstrap3-datetimepicker-rails', '~> 4.17.43'

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platform: :mri
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> anywhere in the code.
  gem 'web-console'

  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'rails_panel'
end
gem 'listen', '~> 3.0.5'
# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]

#编译ruby语言
gem 'rb-readline'

#wechat相关
gem 'wechat'
gem "omniauth-wechat-oauth2"

#http request
gem 'curb'

#计划任务
gem 'whenever'

#config配置
gem 'figaro'

#测试数据
group :test do
  gem "capybara"
  gem "connection_pool"
  gem "launchy"
  gem "mocha"
  gem "poltergeist"
  gem "shoulda-context"
  gem "shoulda-matchers", ">= 3.0.1"
  gem 'fabrication'
  gem 'database_cleaner'
  gem 'minitest-around'
  gem 'minitest-spec-context'
  gem "guard"
  gem "guard-minitest"
  gem "rb-fsevent"
  gem "terminal-notifier-guard"
  gem 'minitest-spec-rails'
  gem 'faker'
  gem 'minitest-rg'
  # gem "test_after_commit"
end

#文件上传组件 和图片工具
gem 'carrierwave'
gem 'mini_magick'

#部署项目
gem 'mina'
gem 'mina-puma', :require => false

gem 'record_tag_helper'

gem 'bbs','0.1.0',path:'./engines/bbs'

# Redis
gem 'redis'
gem 'hiredis'
gem 'redis-namespace'
gem 'redis-objects'
gem 'redis-session-store'