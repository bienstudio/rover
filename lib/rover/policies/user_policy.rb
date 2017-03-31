module Rover
  module Policies
    class User < Base
      def index?
        false
      end

      def show?
        @user == @record
      end

      def create?
        true
      end

      def new?
        create?
      end

      def update?
        show?
      end

      def edit?
        show?
      end

      def destroy?
        show?
      end
    end
  end
end
