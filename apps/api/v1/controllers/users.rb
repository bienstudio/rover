module Rover
  module API
    module V1
      class Users < Base
        include Rover::Interactions

        namespace '/users' do
          get do
          end

          get '/me' do
          end

          post do
            user = User::Create.run!(user: params[:user])

            rabl(user, 'user') if user.valid?
          end

          namespace '/:id' do
            get do
              user = User::Find.run!(user: { id: params[:id] })

              rabl(user, 'user')
            end

            patch do
            end

            delete do
            end
          end
        end
      end
    end
  end
end
