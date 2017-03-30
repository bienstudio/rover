ENV['RACK_ENV'] = 'test'

def spec_root(path = nil)
  root = Pathname.new(File.expand_path('..', __FILE__))

  return root.to_s if path.nil?

  (root + path).to_s
end

def app_root(path)
  spec_root("../#{path}")
end

require 'rspec'
require 'rack/test'
require 'mongoid-rspec'

require 'factory_girl'
require 'database_cleaner'

require 'pry'

require_relative app_root('config/boot')

Dir['./spec/factories/*.rb'].sort.each { |f| require f }

RSpec.configure do |config|
  config.include Rack::Test::Methods
  config.include Rack::Test::Utils
  config.include Mongoid::Matchers
  config.include FactoryGirl::Syntax::Methods

  config.fail_fast = true

  config.before(:suite) do
    DatabaseCleaner.strategy = :truncation
    DatabaseCleaner.clean_with(:truncation)
  end

  config.before(:each) do
    DatabaseCleaner.start
  end

  config.after(:each) do
    DatabaseCleaner.clean
  end
end

Dir[File.expand_path(File.dirname(__FILE__) + "/support/shared_examples/**/*.rb")].each {|f| require f }

def app
  @app ||= Rack::Builder.new do
    eval(File.read(app_root('config.ru')))
  end
end
