describe Rover::Interactions::Trip::Create do
  subject { Rover::Interactions::Trip::Create }

  let(:user) { create(:user) }

  describe '#to_model' do
    it 'returns a new Trip' do
      expect(subject.new.to_model).to be_a Rover::Models::Trip
    end
  end

  describe '#execute' do
    let(:action) do
      subject.run(
        current_user: user,
        trip: {
          name: 'Trip to Sweden',
          start_date: Date.today,
          end_date: Date.tomorrow
        }
      )
    end

    it 'results in a Trip' do
      expect(action.result).to be_a Rover::Models::Trip
      expect(action.result.name).to eql 'Trip to Sweden'
      expect(action.result.start_date).to eql Date.today
      expect(action.result.end_date).to eql Date.tomorrow
    end

    context 'with errors' do
      let(:errored) do
        subject.run(
          current_user: user,
          trip: { }
        )
      end

      it 'includes error details' do
        expect(errored.errors.details.keys).to eql [:trip]
      end

      it 'includes error messages' do
        expect(errored.errors.messages.keys).to eql [:trip]
      end
    end
  end
end
