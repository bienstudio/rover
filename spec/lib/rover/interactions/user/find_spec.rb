describe Rover::Interactions::User::Find do
  subject { Rover::Interactions::User::Find }

  describe '#execute' do
    let(:user) { create(:user) }
    let(:action) do
      subject.run(
        current_user: user,
        user: {
          id: user.id.to_s
        }
      )
    end

    it 'results in a User' do
      expect(action.result).to eql user
    end

    context 'not authorized' do
      let(:action) do
        subject.run(
          current_user: create(:user),
          user: {
            id: user.id.to_s
          }
        )
      end

      it 'calls the policy' do
        expect_any_instance_of(Rover::Policies::User).to receive(:show?).and_return(false)

        action
      end

      it 'fails with error on current user' do
        expect(action.errors).to include :current_user
      end
    end

    context 'not found' do
      let(:action) do
        subject.run(
          current_user: user,
          user: {
            id: 'foobar'
          }
        )
      end

      it 'fails with error on user' do
        expect(action.errors).to include :user
      end
    end
  end
end
