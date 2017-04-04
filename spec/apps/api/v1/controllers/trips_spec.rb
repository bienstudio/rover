describe Rover::API::V1::Trips do
  include Rover::Test::Methods

  let(:user) { create(:user) }
  let(:trips) { create_list(:trip, 3, user: user) }

  before do
    basic_authorize user.api_key, user.api_secret
  end

  describe 'GET /trips' do
    let(:request!) do
      get '/api/v1/trips'
    end

    it 'returns the current user\'s trips' do
      request!

      expect(last_response.body).to eql rabl(user.trips.order('created_at desc'), 'trips')
    end
  end

  describe 'POST /trips' do
    let(:request!) do
      post '/api/v1/trips', { trip: { name: 'Trip to Sweden' } }
    end

    it 'calls the creator' do
      expect { request! }.to run_interaction(Rover::Interactions::Trip::Create).with(
        current_user: user,
        trip: {
          'name' => 'Trip to Sweden'
        }
      )
    end

    it 'returns a user' do
      request!

      expect(last_response.body).to eq rabl(Rover::Models::Trip.last, 'trip')
    end
  end

  describe 'GET /trips/:id' do
    let(:trip) { trips.first }
    let(:request!) do
      get "/api/v1/trips/#{trip.id}"
    end

    it 'calls the finder' do
      expect { request! }.to run_interaction(Rover::Interactions::Trip::Find).with({ current_user: user, trip: { id: trip.id.to_s } })
    end

    it 'returns a user' do
      request!

      expect(last_response.body).to eq rabl(trip, 'trip')
    end
  end

  describe 'PATCH /trips/:id' do
    let(:trip) { trips.first }
    let(:request!) do
      patch "/api/v1/trips/#{trip.id}", { trip: { 'name' => 'Trip to Norway' } }
    end

    it 'calls the updater' do
      expect { request! }.to run_interaction(Rover::Interactions::Trip::Update).with({ current_user: trip.user, record: trip, trip: { 'name' => 'Trip to Norway' } })
    end

    it 'returns a user' do
      request!

      expect(last_response.body).to eq rabl(trip.reload, 'trip')
    end
  end

  describe 'DELETE /trips/:id' do
    let(:trip) { trips.first }
    let(:request!) do
      delete "/api/v1/trips/#{trip.id}"
    end

    it 'calls the destroyer' do
      expect { request! }.to run_interaction(Rover::Interactions::Trip::Destroy).with({ current_user: user, record: trip})
    end

    it 'returns a deleted response' do
      request!

      expect(last_response.body).to eq rabl(trip, 'deleted')
    end
  end
end
