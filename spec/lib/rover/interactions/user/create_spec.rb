describe Rover::Interactions::User::Create do
  subject { Rover::Interactions::User::Create }

  describe '#to_model' do
    it 'returns a new User' do
      expect(subject.new.to_model).to be_a Rover::Models::User
    end
  end

  describe '#execute' do
    let(:action) do
      subject.run(
        user: {
          email: generate(:email),
          password: 'sciencerulez'
        }
      )
    end

    it 'results in a User' do
      expect(action.result).to be_a Rover::Models::User
    end

    context 'with errors' do
      let(:errored) do
        subject.run(
          user: {
            email: 'foo',
            password: 'bar'
          }
        )
      end

      it 'merges error details' do
        expect(errored.errors.details.keys).to eql [:email, :password]
      end

      it 'merges error messages' do
        expect(errored.errors.messages.keys).to eql [:email, :password]
      end
    end
  end
end
