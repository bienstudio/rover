shared_examples 'a policy' do
  let(:user) { build(:user) }
  let(:policy) { subject.new(user, user) }

  describe '#initialize' do
    it 'sets the user' do
      expect(policy.user).to eql user
    end

    it 'sets the record' do
      expect(policy.record).to eql user
    end

    it 'raises an error when user not set' do
      expect { subject.new(nil, user) }.to raise_error Pundit::NotAuthorizedError
    end
  end
end

shared_examples 'a policy scope' do
  let(:user) { build(:user) }
  let(:scope) { subject.new(user, 'scope') }

  describe '#initialize' do
    it 'sets the user' do
      expect(scope.user).to eql user
    end

    it 'sets the scope' do
      expect(scope.scope).to eql 'scope'
    end
  end
end
