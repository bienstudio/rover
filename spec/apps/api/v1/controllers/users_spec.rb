describe Rover::API::V1::Users do
  include Rover::Test::Methods

  let(:user) { create(:user) }

  before do
    basic_authorize user.api_key, user.api_secret
  end

  describe 'POST /users' do
    let(:data) do
      {
        user: {
          'email' => generate(:email),
          'password' => 'science'
        }
      }
    end

    let(:request!) do
      post '/api/v1/users', data
    end

    it 'calls the creator' do
      expect { request! }.to run_interaction(Rover::Interactions::User::Create).with(data)
    end

    it 'returns a user' do
      request!

      expect(last_response.body).to eq rabl(Rover::Models::User.last, 'user')
    end
  end

  describe 'GET /users/me' do
    let(:request!) do
      get '/api/v1/users/me'
    end

    it 'returns the current user' do
      request!

      expect(last_response.body).to eq rabl(user, 'user')
    end
  end

  describe 'GET /users/:id' do
    let(:request!) do
      get "/api/v1/users/#{user.id}"
    end

    it 'calls the finder' do
      expect { request! }.to run_interaction(Rover::Interactions::User::Find).with({ current_user: user, user: { id: user.id.to_s } })
    end

    it 'returns a user' do
      request!

      expect(last_response.body).to eq rabl(user, 'user')
    end
  end

  describe 'PATCH /users/:id' do
    let(:request!) do
      patch "/api/v1/users/#{user.id}", { user: { 'email' => 'bar@foo.com' } }
    end

    it 'calls the updater' do
      expect { request! }.to run_interaction(Rover::Interactions::User::Update).with({ current_user: user, record: user, user: { 'email' => 'bar@foo.com' } })
    end

    it 'returns a user' do
      request!

      expect(last_response.body).to eq rabl(user.reload, 'user')
    end
  end

  describe 'DELETE /users/:id' do
    let(:request!) do
      delete "/api/v1/users/#{user.id}"
    end

    it 'calls the destroyer' do
      expect { request! }.to run_interaction(Rover::Interactions::User::Destroy).with({ current_user: user, record: user})
    end

    it 'returns a deleted response' do
      request!

      expect(last_response.body).to eq rabl(user, 'deleted')
    end
  end
end
