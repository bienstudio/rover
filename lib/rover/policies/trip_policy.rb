module Rover
  module Policies
    class Trip < Base
      def index?
        true
      end

      def show?
        @record.user == @user
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

      class Scope < Scope
        def resolve
          scope.where(user_id: user.id)
        end
      end
    end
  end
end
