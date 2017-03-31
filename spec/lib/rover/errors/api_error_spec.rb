describe Rover::Errors::APIError do
  let(:error) do
    Rover::Errors::APIError.new
  end

  it 'inherits from Error' do
    expect(Rover::Errors::APIError).to be < Rover::Errors::Error
  end

  describe '#initialize' do
    it 'assigns the status attribute to 500 by default' do
      expect(error.status).to eql 500
    end

    it 'assigns the type to API error by default' do
      expect(error.type).to eql :api_error
    end

    it 'assigns the message to API error by default' do
      expect(error.message).to eql 'api error'
    end
  end
end
