require 'sinatra/reloader'

module Rover
  module Web
    class Base < Sinatra::Base
      register Sinatra::Namespace

      helpers Rover::Helpers::Response
      helpers Rover::Helpers::Authentication

      configure do
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
