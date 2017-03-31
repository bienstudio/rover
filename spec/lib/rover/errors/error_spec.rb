describe Rover::Errors::Error do
  let(:error) do
    Rover::Errors::Error.new({
      status: 404,
      type: 'invalid',
      message: 'not found'
    })
  end

  it 'inherits from StandardError' do
    expect(Rover::Errors::Error).to be < StandardError
  end

  describe '#initialize' do
    it 'assigns the status attribute' do
      expect(error.status).to eql 404
    end

    it 'assigns the type' do
      expect(error.type).to eql 'invalid'
    end

    it 'assigns the message' do
      expect(error.message).to eql 'not found'
    end
  end
end
