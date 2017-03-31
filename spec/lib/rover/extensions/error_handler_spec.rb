describe Rover::Extensions::ErrorHandler do
  let(:app) { lambda { |env| [200, {'Content-Type' => 'text/plain'}, env['PATH_INFO']] } }
  let(:extension) { Rover::Extensions::ErrorHandler.new(app) }

  describe '#initialize' do
    it 'sets the app' do
      expect(extension.instance_variable_get(:@app)).to eql app
    end
  end

  describe '#handle_error' do
    context 'Mongoid validation error' do
      let(:error) do
        user = Rover::Models::User.new
        user.valid?

        Mongoid::Errors::Validations.new(user)
      end

      it 'outputs the details' do
        json = extension.handle_error(error).last.first

        expect(json).to include 'invalid_request'
        expect(json).to include 'email'
      end
    end

    context 'interaction error' do
      let(:error) do
        ActiveInteraction::InvalidInteractionError.new(message: 'foo')
      end

      it 'outputs the message' do
        json = extension.handle_error(error).last.first

        expect(json).to include 'invalid_request'
        expect(json).to include 'foo'
      end
    end

    context 'JSON parsing error' do
      let(:error) do
        JSON::ParserError.new
      end

      it 'outputs message about trouble parsing' do
        json = extension.handle_error(error).last.first

        expect(json).to include 'invalid_request'
        expect(json).to include 'Problem parsing JSON'
      end
    end

    context 'Mongoid not found error' do
      let(:error) do
        Mongoid::Errors::DocumentNotFound.new(Rover::Models::User, id: 123)
      end

      it 'outputs not found message' do
        json = extension.handle_error(error).last.first

        expect(json).to include 'not found'
      end
    end

    context 'Sinatra not found error' do
      let(:error) do
        Sinatra::NotFound.new
      end

      it 'outputs a not found message' do
        json = extension.handle_error(error).last.first

        expect(json).to include 'not found'
      end
    end

    context 'base error' do
      let(:error) do
        Rover::Errors::Error.new(message: 'foo')
      end

      it 'outputs whatever is put in' do
        json = extension.handle_error(error).last.first

        expect(json).to include 'foo'
      end
    end

    context 'any other error' do
      let(:error) do
        StandardError.new
      end

      it 'outputs an internal error' do
        json = extension.handle_error(error).last.first

        expect(json).to include 'StandardError'
      end
    end
  end
end
