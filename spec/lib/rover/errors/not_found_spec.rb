describe Rover::Errors::NotFound do
  let(:error) do
    Rover::Errors::NotFound.new
  end

  it 'inherits from InvalidRequest' do
    expect(Rover::Errors::NotFound).to be < Rover::Errors::InvalidRequest
  end

  describe '#initialize' do
    it 'assigns the status attribute to 404 by default' do
      expect(error.status).to eql 404
    end

    it 'assigns the message to not found by default' do
      expect(error.message).to eql 'not found'
    end
  end
end
