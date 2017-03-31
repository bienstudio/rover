describe Rover::Policies::User do
  subject { Rover::Policies::User }

  let(:user)   { build(:user) }
  let(:policy) { subject.new(user, user) }
  let(:nonmatching) { subject.new(user, build(:user)) }

  it_behaves_like 'a policy'

  describe '#index?' do
    it 'always returns false' do
      expect(policy.index?).to eql false
    end
  end

  describe '#show?' do
    it 'returns true if user matches record' do
      expect(policy.show?).to eql true
    end

    it 'returns false if user does not match record' do
      expect(nonmatching.show?).to eql false
    end
  end

  describe '#create?' do
    it 'always returns true' do
      expect(policy.create?).to eql true
    end
  end

  describe '#new?' do
    it 'always returns true' do
      expect(policy.new?).to eql true
    end
  end

  describe '#update?' do
    it 'returns true if user matches record' do
      expect(policy.update?).to eql true
    end

    it 'returns false if user does not match record' do
      expect(nonmatching.update?).to eql false
    end
  end

  describe '#edit?' do
    it 'returns true if user matches record' do
      expect(policy.edit?).to eql true
    end

    it 'returns false if user does not match record' do
      expect(nonmatching.edit?).to eql false
    end
  end

  describe '#destroy?' do
    it 'returns true if user matches record' do
      expect(policy.destroy?).to eql true
    end

    it 'returns false if user does not match record' do
      expect(nonmatching.destroy?).to eql false
    end
  end

  describe Rover::Policies::User::Scope do
    let(:scope) { Rover::Policies::User::Scope.new(user, 'scope') }

    subject { Rover::Policies::User::Scope }

    it_behaves_like 'a policy scope'

    describe '#resolve' do
      it 'returns the scope' do
        expect(scope.resolve).to eql 'scope'
      end
    end
  end
end
