describe Rover::Models::Flight, type: :model do
  let(:flight) { create :flight }

  it 'embeds many segments' do
    expect(flight).to embed_many :segments
  end

  it 'embeds many passengers' do
    expect(flight).to embed_many :passengers
  end

  describe Rover::Models::Flight::Segment, type: :model do
    let(:segment) { flight.segments.first }

    it 'is embedded in a flight' do
      expect(segment).to be_embedded_in :flight
    end
  end

  describe Rover::Models::Flight::Passenger, type: :model do
    let(:passenger) { flight.passengers.first }

    it 'is embedded in a flight' do
      expect(passenger).to be_embedded_in :flight
    end
  end
end
