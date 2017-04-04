module Rover
  module API
    module V1
      class Trips < Base
        include Rover::Interactions

        namespace '/trips' do
          get do
            trips = current_user.trips.order('created_at desc')

            rabl(trips, 'trips')
          end

          post do
            trip = Trip::Create.run!(
              current_user: current_user,
              trip: params[:trip]
            )

            rabl(trip, 'trip')
          end

          namespace '/:id' do
            before do
              @trip ||= Trip::Find.run!(
                current_user: current_user,
                trip: {
                  id: params[:id]
                }
              )
            end

            get do
              rabl(@trip, 'trip')
            end

            patch do
              @trip = Trip::Update.run!(
                current_user: current_user,
                record: @trip,
                trip: params[:trip]
              )

              rabl(@trip, 'trip')
            end

            delete do
              @trip = Trip::Destroy.run!(
                current_user: current_user,
                record: @trip
              )

              rabl(@trip, 'deleted')
            end
          end
        end
      end
    end
  end
end
