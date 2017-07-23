module Rover
  module Models
    class Plan
      include Mongoid::Document
      include Mongoid::Timestamps

      store_in collection: 'plans'

      field :booking_date, type: Date
      field :booking_reference, type: String
      field :booking_rate, type: Float
      field :total_cost, type: Float
      field :purchased, type: Boolean
      field :note, type: String

      belongs_to :trip

      def to_props
        props = self.attributes.clone
        props['id'] = props.delete('_id').to_s
        props['trip_id'] = props.delete('trip_id').to_s
        props['type'] = props.delete('_type').split('::').last.downcase
        props
      end
    end
  end
end
