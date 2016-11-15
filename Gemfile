source 'https://rubygems.org'

ruby ENV['CUSTOM_RUBY_VERSION'] || '2.3.0'

gem 'sinatra', '~> 1.4.7'
gem 'datamapper'
gem 'thin'
gem 'dotenv'
gem 'slim'
gem 'sass'
gem 'dm-core'
gem 'dm-migrations'

group :production do
  gem 'pg', '>= 0.15'
  gem 'dm-postgres-adapter'
  gem 'do_postgres', '>= 0.10.17'
end

group :development do
  gem 'sqlite3'
  gem 'dm-sqlite-adapter'
end
