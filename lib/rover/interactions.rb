require 'active_interaction'

module Rover
  module Interactions
  end
end

require_relative 'interactions/base'

require_relative 'interactions/user/find'
require_relative 'interactions/user/create'
require_relative 'interactions/user/update'
require_relative 'interactions/user/destroy'

require_relative 'interactions/trip/find'
require_relative 'interactions/trip/create'
require_relative 'interactions/trip/update'
require_relative 'interactions/trip/destroy'

require_relative 'interactions/plan/create'

require_relative 'interactions/plan/flight/create'
