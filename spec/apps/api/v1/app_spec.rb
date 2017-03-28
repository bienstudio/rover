describe Rover::API::V1::App do
  it 'has router middleware' do
    expect(Rover::API::V1::App.middleware.flatten).to include Sinatra::Router
  end
end
