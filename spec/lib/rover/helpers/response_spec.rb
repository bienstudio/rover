class DummyClass
end

describe Rover::Helpers::Response do
  let(:klass) do
    dummy = DummyClass.new
    dummy.extend(Rover::Helpers::Response)
    dummy
  end

  describe '#rabl' do
    it 'calls the Rabl render method' do
      expect(Rabl).to receive(:render).with('foo', 'bar')

      klass.rabl('foo', 'bar')
    end
  end
end
