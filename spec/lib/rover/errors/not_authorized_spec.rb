describe Rover::Errors::NotAuthorized do
  let(:error) do
    Rover::Errors::NotAuthorized.new
  end

  it 'inherits from InvalidRequest' do
    expect(Rover::Errors::NotAuthorized).to be < Rover::Errors::InvalidRequest
  end

  describe '#initialize' do
    it 'assigns the status attribute to 404 by default' do
      expect(error.status).to eql 403
    end

    it 'assigns the message to not found by default' do
      expect(error.message).to eql 'not authorized'
    end
  end
end
