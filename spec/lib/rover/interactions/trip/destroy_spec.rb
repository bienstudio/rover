describe Rover::Interactions::Trip::Destroy do
  subject { Rover::Interactions::Trip::Destroy }

  let(:trip) { create(:trip) }
  let(:user) { trip.user }

  describe '#execute' do
    let(:action) do
      subject.run(
        current_user: user,
        record: trip
      )
    end

    it 'results in a Trip' do
      expect(action.result).to be_a Rover::Models::Trip
    end

    it 'destroys the trip' do
      expect(action.result.destroyed?).to eql true
    end
  end
end
