module Rover
  module Test
    module Methods
      def rabl(*args)
        Rabl::Renderer.json(*args)
      end
    end
  end
end
