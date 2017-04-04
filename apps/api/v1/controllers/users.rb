module Rover
  module API
    module V1
      class Users < Base
        include Rover::Interactions

        namespace '/users' do
          post do
            user = User::Create.run!(user: params[:user])

            rabl(user, 'user')
          end

          get '/me' do
            rabl(current_user, 'user')
          end

          namespace '/:id' do
            before do
              pass if request.path_info.include?('me')

              @user ||= User::Find.run!(
                current_user: current_user,
                user: {
                  id: params[:id]
                }
              )
            end

            get do
              rabl(@user, 'user')
            end

            patch do
              @user = User::Update.run!(
                current_user: current_user,
                record: @user,
                user: params[:user]
              )

              rabl(@user, 'user')
            end

            delete do
              @user = User::Destroy.run!(
                current_user: current_user,
                record: @user
              )

              rabl(@user, 'deleted')
            end
          end
        end
      end
    end
  end
end
