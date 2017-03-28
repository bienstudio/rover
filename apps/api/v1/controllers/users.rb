module Rover
  module API
    module V1
      class Users < Base
        namespace '/users' do

          # GET /api/v1/users
          get do
          end

          # POST /api/v1/users
          post do
          end

          namespace '/:id' do

            # GET /api/v1/users/:id
            get do
            end

            # PATCH /api/v1/users/:id
            patch do
            end

            # DELETE /api/v1/users/:id
            delete do
            end
          end
        end
      end
    end
  end
end
