module Rover
  module Web
    class Trips < Base
      namespace '/trips' do
        namespace '/:permalink' do
          get do
            @trip = Rover::Models::Trip.where(permalink: params[:permalink]).first

            haml :'trips/show'
          end
        end
      end
    end
  end
end
