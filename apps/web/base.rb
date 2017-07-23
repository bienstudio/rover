require 'sinatra/reloader'
require 'sinatra/flash'

module Rover
  module Web
    class Base < Sinatra::Base
      register Sinatra::Namespace
      register Sinatra::Flash

      helpers Rover::Helpers::Response
      helpers Rover::Helpers::Authentication

      configure do
        # set :views, 'apps/web/views'
        set :root, File.expand_path('../', __FILE__)
        # set :views,
        set :sessions, true
        set :logging, true
      end

      configure :development do
        register Sinatra::Reloader

        set :reloading, true
      end

      before do
      end
    end
  end
end
