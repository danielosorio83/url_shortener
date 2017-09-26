source 'https://rubygems.org'

ruby '2.4.0'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?('/')
  "https://github.com/#{repo_name}.git"
end

gem 'bootstrap', '~> 4.0.0.beta'
gem 'clipboard-rails', '1.7.1'
gem 'font-awesome-rails', '4.7.0.2'
gem 'jbuilder', '~> 2.5'
gem 'jquery-rails', '4.3.1'
gem 'pg', '0.21.0'
gem 'puma', '~> 3.7'
gem 'rails', '~> 5.1.4'
gem 'sass-rails', '~> 5.0'
gem 'turbolinks', '~> 5'
gem 'uglifier', '>= 1.3.0'

group :development, :test do
  gem 'database_cleaner', '1.6.1'
  gem 'factory_girl_rails', '4.8.0'
  gem 'faker', '1.8.4'
  gem 'rails-controller-testing', '1.0.2'
  gem 'rspec-rails', '~> 3.5'
  gem 'shoulda-callback-matchers', '1.1.4'
  gem 'shoulda-matchers', '3.1.2'
end

group :development do
  gem 'annotate', '2.7.2'
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'web-console', '>= 3.3.0'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]
