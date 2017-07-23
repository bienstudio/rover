require 'warden'

module Rover
  module Extensions
    module Authentication extend self
      def registered(app)
        app.use Warden::Manager do |manager|
          manager.failure_app = app
          # manager.default_scope = :api
          manager.failure_app = app
          manager.scope_defaults :default, strategies: [:password], action: 'login'
        end
      end
    end
  end
end

Warden::Manager.serialize_into_session do |user|
  user.id
end

Warden::Manager.serialize_from_session do |id|
  Rover::Models::User.find(id)
end

Warden::Strategies.add(:password) do
  def valid?
    params['email'] || params['password']
  end

  def store?
    true
  end

  def authenticate!
    if user = Rover::Models::User.authenticate(params['email'], params['password'])
      success!(user)
    else
      errors.add(:email, 'Incorrect email or password')
      fail!
    end
  end
end

Warden::Strategies.add(:api_credentials) do
  def auth
    @auth ||= Rack::Auth::Basic::Request.new(env)
  end

  def valid?
    auth.provided? && auth.basic?
  end

  def store?
    false
  end

  def authenticate!
    if user = Rover::Models::User.where(api_key: auth.credentials.first, api_secret: auth.credentials.last).first
      success!(user)
    else
      fail!
    end
  end
end
