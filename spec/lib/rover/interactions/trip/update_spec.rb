describe Rover::Interactions::Trip::Update do
  subject { Rover::Interactions::Trip::Update }

  let(:trip) { create(:trip) }
  let(:user) { trip.user }

  describe '#execute' do
    let(:action) do
      subject.run(
        current_user: user,
        record: trip,
        trip: {
          name: 'Trip to Norway'
        }
      )
    end

    it 'results in a Trip' do
      expect(action.result).to be_a Rover::Models::Trip
    end

    it 'changes the name' do
      expect(action.result.name).to eql 'Trip to Norway'
    end
  end
end
