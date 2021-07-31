source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.6.5'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails', branch: 'main'
gem 'rails', '~> 6.0.4'
# Use sqlite3 as the database for Active Record
# gem 'sqlite3', '~> 1.4'
# Use Puma as the app server
gem 'puma', '~> 4.1'
# Use SCSS for stylesheets
gem 'sass-rails', '>= 6'
# Transpile app-like JavaScript. Read more: https://github.com/rails/webpacker
gem 'webpacker', '~> 4.0'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.7'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 4.0'
# Use Active Model has_secure_password
gem 'bcrypt', '~> 3.1.7'

# Use Active Storage variant
# gem 'image_processing', '~> 1.2'

# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', '>= 1.4.2', require: false

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  # == 幫助開發及測試用的 gem ==
  gem 'sqlite3' # 因為 sqlite3不能在 heroku 上使用
  gem 'launchy' #Launch pages during testing
  gem 'hirb-unicode' #在 console 中產生圖形化資料表格，在rails c執行Hirb.enable，就可將Hirb功能開啟
   # Windows does not include zoneinfo files, so bundle the tzinfo-data gem
  gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
  gem 'rspec-rails', '~> 3.9' # RSpec testing framework
  gem 'faker', '~> 2.10'  #加入faker 建立測試用的假資料
  gem 'factory_bot_rails', '~> 5.1', '>= 5.1.1' #測試用，取代 factory_girl_rails
  gem 'better_errors' #helps when things go wrong
  gem 'binding_of_caller' #錯誤訊息顯示
  gem "foreman" #同時開啟webpack server 和 rails server
end

group :development do
  # Access an interactive console on exception pages or by calling 'console' anywhere in the code.
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '~> 3.2'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

group :test do
  # Adds support for Capybara system testing and selenium driver
  gem 'capybara', '>= 2.15'
  gem 'selenium-webdriver'
  # Easy installation and use of web drivers to run system tests with browsers
  gem 'webdrivers'
end

group :production do
  gem 'pg', '~> 1.2', '>= 1.2.3' #heroku 上使用 postgresql
end

gem 'autoprefixer-rails' #parse css 功能
gem 'nokogiri' #gem 'nokogiri' #HTML, XML, SAX 的 parser，他可以藉由 XPath or CSS3 selectors 來尋找 XML/HTML 中的 tag
gem 'uglifier', '~> 2.6.1' #修正 asset precompile 問題
gem 'mini_racer', '~> 0.3.1' #修正 asset precompile 問題

gem 'kaminari', '~> 1.2'  #分頁功能 rails_admin 需使用

<<<<<<< HEAD
=======
gem 'travis', '~> 1.8', '>= 1.8.2' #push到github後自動執行
>>>>>>> a612a7ae877f7cff136636e4cdf13db8c0878c48
gem 'ransack' # 查詢搜尋
gem 'aasm', '~> 4.11' #狀態機

# 多國語系
gem 'i18n', '~> 1.8', '>= 1.8.2'
gem 'rails-i18n', '~> 6.0'