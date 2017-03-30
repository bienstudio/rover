describe Trip do
  let(:trip) { create(:trip) }

  it { expect(trip).to have_timestamps }

  it { expect(trip).to belong_to :user }

  it { expect(trip).to validate_presence_of :name }

  it { expect(trip).to validate_presence_of :user }

  describe '#validate_date_order' do
    before do
      trip.start_date = Date.tomorrow
      trip.end_date = Date.yesterday
      trip.valid?
    end

    it 'does not let the end date be after the start date' do
      expect(trip.errors).to include :end_date
    end
  end

  describe '#generate_permalink!' do
    it 'creates a permalink' do
      expect(trip.permalink).to_not eql nil
    end

    context 'with conflict' do
      before do
        @trip1 = create(:trip, user: trip.user, name: 'Trip to Sweden')
        @trip2 = create(:trip, user: trip.user, name: 'Trip to Sweden')
      end

      it 'increments the suffix of the permalink' do
        expect(@trip2.permalink).to eql 'trip-to-sweden-1'
      end
    end
  end
end
