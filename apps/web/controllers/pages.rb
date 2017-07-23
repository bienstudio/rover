module Rover
  module Web
    class Pages < Base
      get '/' do
        return redirect to('/login') unless authenticated?

        redirect to('/trips')
      end
    end
  end
end
