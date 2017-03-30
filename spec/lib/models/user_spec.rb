describe User do
  let(:user) { create(:user) }

  it { expect(user).to be_mongoid_document }

  it { expect(user).to have_timestamps }

  it { expect(user).to have_many :trips }

  it { expect(user).to validate_presence_of :email }
  it { expect(user).to validate_format_of(:email).to_allow('e@g.org').not_to_allow('foobar') }

  it { expect(user).to validate_presence_of(:password).on(:create) }
  it { expect(user).to validate_length_of(:password).greater_than(6).on(:create) }

  describe '.authenticate' do
    it 'returns user for matching email/password combination' do
      expect(User.authenticate(user.email, 'sciencerulez')).to eql user
    end

    it 'returns nil if email not found' do
      expect(User.authenticate('foobar', 'sciencerulez')).to eql nil
    end

    it 'returns nil if email found but password does not match' do
      expect(User.authenticate(user.email, 'foobar')).to eql nil
    end
  end

  describe '#password_matches?' do
    it 'returns true for the correct password' do
      expect(user.password_matches?('sciencerulez')).to eql true
    end

    it 'returns false for the incorrect password' do
      expect(user.password_matches?('foobar')).to eql false
    end
  end

  describe '#encrypt_password!' do
    it 'sets the password hash' do
      expect(user.password_hash).to_not be_nil
    end

    it 'sets the password salt' do
      expect(user.password_salt).to_not be_nil
    end
  end

  describe '#generate_api_keys!' do
    it 'sets the api key' do
      expect(user.api_key).to_not be_nil
    end

    it 'sets the api secret' do
      expect(user.api_secret).to_not be_nil
    end
  end
end
