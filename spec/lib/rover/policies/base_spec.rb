describe Rover::Policies::Base do
  let(:user)   { build(:user) }
  let(:policy) { Rover::Policies::Base.new(user, user) }

  subject { Rover::Policies::Base }

  it_behaves_like 'a policy'

  describe '#index?' do
    it 'is set to false by default' do
      expect(policy.index?).to eql false
    end
  end

  describe '#show?' do
    it 'is set to false by default' do
      expect(policy.show?).to eql false
    end
  end

  describe '#create?' do
    it 'is set to false by default' do
      expect(policy.create?).to eql false
    end
  end

  describe '#new?' do
    it 'is set to false by default' do
      expect(policy.new?).to eql false
    end
  end

  describe '#update?' do
    it 'is set to false by default' do
      expect(policy.update?).to eql false
    end
  end

  describe '#edit?' do
    it 'is set to false by default' do
      expect(policy.edit?).to eql false
    end
  end

  describe '#destroy?' do
    it 'is set to false by default' do
      expect(policy.destroy?).to eql false
    end
  end

  describe Rover::Policies::Base::Scope do
    let(:scope) { Rover::Policies::Base::Scope.new(user, 'scope') }

    subject { Rover::Policies::Base::Scope }

    it_behaves_like 'a policy scope'

    describe '#resolve' do
      it 'returns the scope' do
        expect(scope.resolve).to eql 'scope'
      end
    end
  end
end
