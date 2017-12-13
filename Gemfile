source 'https://rubygems.org'

 git_source(:github) do |repo_name|
   repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
   "https://github.com/#{repo_name}.git"
 end

 # Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
 gem 'rails', '~> 5.1.2'

 group :production do
   # Use pg as the production database for Active Record
   gem 'rails_12factor'
   gem 'pg'
 end

 group :development, :test do
   # Use sqlite3 as the development database for Active Record
   gem 'sqlite3'
   gem 'foreman'
 end

 # Use Puma as the app server
 gem 'puma', '~> 3.0'
 # Use SCSS for stylesheets
 gem 'sass-rails', '~> 5.0'
 # Use Uglifier as compressor for JavaScript assets
 gem 'uglifier', '>= 1.3.0'

 # Use jquery as the JavaScript library
 gem 'jquery-rails'
 # Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
 gem 'turbolinks', '~> 5'
 # Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
 gem 'jbuilder', '~> 2.5'

 gem 'thor', '0.19.1'

 gem 'bootstrap-sass'
 # Use Bootstrap Forms as a Rails form builder
 gem 'bootstrap_form'
 # Use Paperclip as an image and file manager
 gem "paperclip", "~> 5.0.0"
 # Use Pundit as a permissions manager
 gem "pundit"
 # Use Stripe for user payments
 gem "stripe"
 # Use Figaro to safely store environment variables
 gem "figaro"
 # Use RedCarpet for markdown parsing and editing
 gem "redcarpet"

 group :development, :test do
   # Call 'byebug' anywhere in the code to stop execution and get a debugger console
   gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
   gem 'rspec-rails', '~> 3.0'
   gem 'rails-controller-testing'
   gem 'shoulda'
   gem 'factory_bot_rails', '~> 4.0'
 end

 group :development do
   gem 'listen', '~> 3.0.5'
   gem 'web-console', '>= 3.3.0'
   # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
   gem 'spring'
   gem 'spring-watcher-listen', '~> 2.0.0'
 end

# Used for encrypting passwords
gem 'bcrypt', '~> 3.1.9'

# Use 'devise' for authentication
gem 'devise'

# Use Figaro for environment variable protection
gem 'figaro'
