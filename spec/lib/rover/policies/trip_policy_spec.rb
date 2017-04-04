describe Rover::Policies::Trip do
  subject { Rover::Policies::Trip }

  let(:trip)   { create(:trip) }
  let(:policy) { subject.new(trip.user, trip) }
  let(:nonmatching) { subject.new(build(:user), trip) }

  it_behaves_like 'a policy'

  describe '#index?' do
    it 'always returns true' do
      expect(policy.index?).to eql true
    end
  end

  describe '#show?' do
    it 'returns true if user matches the trip user' do
      expect(policy.show?).to eql true
    end

    it 'returns false if user does not match the trip user' do
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

  describe Rover::Policies::Trip::Scope do
    let(:scope) { Rover::Policies::Trip::Scope.new(trip.user, Rover::Models::Trip) }

    subject { Rover::Policies::Trip::Scope }

    it_behaves_like 'a policy scope'

    describe '#resolve' do
      it 'scopes the relation to just the user\'s trips' do
        expect(scope.resolve.selector).to eql({ 'user_id' => trip.user.id })
        expect(scope.resolve).to include trip
      end
    end
  end
end
