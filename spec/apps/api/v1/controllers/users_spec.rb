describe Rover::API::V1::Users do
  include Rover::Test::Methods

  let(:user) { create(:user) }

  describe 'POST /users' do
    let(:data) do
      {
        user: {
          'email' => generate(:email),
          'password' => 'science'
        }
      }
    end

    def request!(_data = data)
      post "/api/v1/users", _data
    end

    it 'calls the creator' do
      expect { request! }.to run_interaction(Rover::Interactions::User::Create).with(data)
    end

    it 'returns a user' do
      request!

      expect(last_response.body).to eq rabl(Rover::Models::User.last, 'user')
    end
  end

  describe 'GET /users/:id' do
    def request!(_user = user)
      get "/api/v1/users/#{_user.id}"
    end

    it 'calls the finder' do
      expect { request! }.to run_interaction(Rover::Interactions::User::Find).with({ user: { id: user.id.to_s } })
    end

    it 'returns a user' do
      request!

      expect(last_response.body).to eq rabl(user, 'user')
    end
  end
end
