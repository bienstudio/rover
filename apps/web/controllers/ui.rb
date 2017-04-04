module Rover
  module Web
    class UI < Base
      namespace '/ui' do
        get do
          haml :'ui/index'
        end
      end
    end
  end
end
