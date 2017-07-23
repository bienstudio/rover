module Rover
  module Models
    class Trip
      include Mongoid::Document
      include Mongoid::Timestamps

      store_in collection: 'trips'

      field :name, type: String
      field :permalink, type: String
      field :start_date, type: Date
      field :end_date, type: Date

      belongs_to :user

      has_many :plans

      validates :name, presence: true
      validates :user, presence: true

      validate :validate_date_order

      before_create :generate_permalink!

      def to_props
        {
          id: self.id.to_s,
          name: self.name,
          permalink: self.permalink,
          start_date: self.start_date,
          end_date: self.end_date,
          user: user.to_props,
          plans: plans_by_date
        }.to_json
      end

      def plans_by_date
        filtered_plans = []
        self.plans.each do |plan|
          if plan.is_a?(Rover::Models::Flight)
            plan.segments.each do |segment|
              filtered_plans << segment
            end
          else
            filtered_plans << plan
          end
        end

        dates = filtered_plans.group_by { |plan| plan.start_time.to_date }

        dates.each do |date, plans|
          dates[date] = []
          plans.each do |plan|
            dates[date] << plan.to_props
          end
        end

        if start_date && end_date
          (start_date..end_date).reject { |date| dates.include?(date) }
                                .each { |date| dates[date] = [] }
        end

        dates
      end

      private

      def validate_date_order
        return unless start_date && end_date

        if start_date > end_date
          errors.add(:end_date, 'must be after start date')
        end
      end

      def generate_permalink!
        candidate = self.name.parameterize

        conflicts = Trip.where(user_id: self.user.id, permalink: candidate).count

        if conflicts.zero?
          self.permalink = self.name.parameterize
        else
          self.permalink = "#{self.name.parameterize}-#{conflicts}"
        end
      end
    end
  end
end
