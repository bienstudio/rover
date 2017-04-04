module Rover
  module Interactions
    module Trip
      class Update < Base
        object :current_user, class: Rover::Models::User
        object :record, class: Rover::Models::Trip
        hash :trip do
          string :name, default: nil
          date :start_date, default: nil
          date :end_date, default: nil
        end

        def execute
          not_authorized! unless Rover::Policies::Trip.new(current_user, record).update?

          record.name       = trip['name']        if trip['name']
          record.start_date = trip['start_date']  if trip['start_date']
          record.end_date   = trip['end_date']    if trip['end_date']

          unless record.save
            merge_errors!(record)
          end

          record
        end
      end
    end
  end
end
