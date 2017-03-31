describe Rover::Errors::InvalidRequest do
  let(:error) do
    Rover::Errors::InvalidRequest.new
  end

  it 'inherits from Error' do
    expect(Rover::Errors::InvalidRequest).to be < Rover::Errors::Error
  end

  describe '#initialize' do
    it 'assigns the status attribute to 400 by default' do
      expect(error.status).to eql 400
    end

    it 'assigns the type to invalid request by default' do
      expect(error.type).to eql :invalid_request
    end
  end
end
