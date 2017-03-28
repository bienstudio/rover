describe Rover::API::V1 do
  describe '.new' do
    it 'returns a Rack Builder' do
      expect(Rover::API::V1.new).to be_a Rack::Builder
    end
  end
end
