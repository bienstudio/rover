module Rover
  module Web
    class Sessions < Base
      get '/login' do
        haml :'sessions/new', layout: nil
      end

      post '/sessions/create' do
        binding.pry

        warden.authenticate!

        unless authenticated?
          flash[:error] = 'Email/password incorrect'
        end

        redirect '/'
      end
    end
  end
end
