describe Rover::API::V1::Base do
  it 'has a namespace extension' do
    expect(Rover::API::V1::Base.extensions).to include Sinatra::Namespace
  end
end
