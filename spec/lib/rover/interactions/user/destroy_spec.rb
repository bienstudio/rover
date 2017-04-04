describe Rover::Interactions::User::Destroy do
  subject { Rover::Interactions::User::Destroy }

  let(:user) { create(:user) }

  describe '#execute' do
    let(:action) do
      subject.run(
        current_user: user,
        record: user
      )
    end

    it 'results in a User' do
      expect(action.result).to be_a Rover::Models::User
    end

    it 'destroys the user' do
      expect(action.result.destroyed?).to eql true
    end
  end
end
