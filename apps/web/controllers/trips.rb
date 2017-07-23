module Rover
  module Web
    class Trips < Base
      namespace '/trips' do
        get do
          @trips = Rover::Models::Trip.all

          haml :'trips/index'
        end

        namespace '/:permalink' do
          before do
            @trip = Rover::Models::Trip.where(permalink: params[:permalink]).first
          end

          get do
            haml :'trips/show'
          end

          namespace '/plans' do
            get '/new' do
              haml :'plans/new'
            end
          end
        end
      end
    end
  end
end
