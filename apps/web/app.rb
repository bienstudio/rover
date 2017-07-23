require 'sinatra/base'
require 'sinatra/namespace'
require 'sinatra/router'

require_relative 'base'

require_relative 'controllers/pages'
require_relative 'controllers/trips'
require_relative 'controllers/sessions'
require_relative 'controllers/ui'

module Rover
  module Web
    class App < Base
      register Sinatra::Warden

      configure do
        set :public_folder, 'public'
        set :auth_success_path, '/'
        set :auth_failure_path, '/login'
        set :auth_login_template, :'sessions/new'
      end

      register Rover::Extensions::Authentication

      use Sinatra::Router do
        mount Pages
        mount Trips
        mount Sessions
        mount UI
      end
    end
  end
end
