require 'sinatra/base'
require 'sinatra/namespace'
require 'sinatra/router'

require_relative 'base'

require_relative 'controllers/ui'

module Rover
  module Web
    class App < Base
      use Sinatra::Router do
        mount UI
      end
    end
  end
end
