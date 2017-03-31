require 'sinatra/reloader'

module Rover
  module API
    module V1
      class Base < Sinatra::Base
        register Sinatra::Namespace

        helpers Rover::Helpers::Response

        configure do
          set :sessions, true
          set :logging, true
        end

        configure :development do
          register Sinatra::Reloader

          set :reloading, true
        end

        before do
          content_type :json
        end
      end
    end
  end
end
