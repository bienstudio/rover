module Rover
  module Helpers
    module Response
      def rabl(resource, view)
        Rabl.render(resource, view)
      end
    end
  end
end
