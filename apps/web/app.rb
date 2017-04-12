require 'sinatra/base'
require 'sinatra/namespace'
require 'sinatra/router'

require_relative 'base'

require_relative 'controllers/ui'
require_relative 'controllers/trips'

module Rover
  module Web
    class App < Base
      configure do
        set :root, File.expand_path('../../../', __FILE__)
        set :public_folder, 'public'
      end

      use Sinatra::Router do
        mount UI
        mount Trips
      end
    end
  end
end
