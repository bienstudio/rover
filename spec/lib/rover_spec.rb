describe Rover do
  describe '.apps' do
    it 'returns a Rack URLMap' do
      expect(Rover.apps).to be_a Rack::URLMap
    end
  end
end
