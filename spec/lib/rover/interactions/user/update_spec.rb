describe Rover::Interactions::User::Update do
  subject { Rover::Interactions::User::Update }

  let(:user) { create(:user) }

  describe '#execute' do
    let(:action) do
      subject.run(
        current_user: user,
        record: user,
        user: {
          email: 'foo@bar.com'
        }
      )
    end

    it 'results in a User' do
      expect(action.result).to be_a Rover::Models::User
    end

    it 'changes the email' do
      expect(action.result.email).to eql 'foo@bar.com'
    end

    context 'with errors' do
      let(:errored) do
        subject.run(
          current_user: user,
          record: user,
          user: {
            email: 'foo'
          }
        )
      end

      it 'includes error details' do
        expect(errored.errors.details.keys).to eql [:email]
      end
    end
  end
end
