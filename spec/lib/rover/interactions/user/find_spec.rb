describe Rover::Interactions::User::Find do
  subject { Rover::Interactions::User::Find }

  describe '#execute' do
    let(:user) { create(:user) }
    let(:action) do
      subject.run(
        user: {
          id: user.id.to_s
        }
      )
    end

    it 'results in a User' do
      expect(action.result).to eql user
    end
  end
end
