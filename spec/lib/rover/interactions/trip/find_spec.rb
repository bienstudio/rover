describe Rover::Interactions::Trip::Find do
  subject { Rover::Interactions::Trip::Find }

  describe '#execute' do
    let(:trip) { create(:trip) }
    let(:action) do
      subject.run(
        current_user: trip.user,
        trip: {
          id: trip.id.to_s
        }
      )
    end

    it 'results in a Trip' do
      expect(action.result).to eql trip
    end

    context 'not authorized' do
      let(:action) do
        subject.run(
          current_user: create(:user),
          trip: {
            id: trip.id.to_s
          }
        )
      end

      it 'calls the policy' do
        expect_any_instance_of(Rover::Policies::Trip).to receive(:show?).and_return(false)

        action
      end

      it 'fails with error on current user' do
        expect(action.errors).to include :current_user
      end
    end

    context 'not found' do
      let(:action) do
        subject.run(
          current_user: trip.user,
          trip: {
            id: 'foobar'
          }
        )
      end

      it 'fails with error on user' do
        expect(action.errors).to include :trip
      end
    end
  end
end
