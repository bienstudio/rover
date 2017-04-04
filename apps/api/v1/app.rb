require 'sinatra/base'
require 'sinatra/namespace'
require 'sinatra/router'

require_relative 'base'

require_relative 'controllers/users'
require_relative 'controllers/trips'

module Rover
  module API
    module V1
      class App < Base
        use Sinatra::Router do
          mount Users
          mount Trips
        end
      end
    end
  end
end
