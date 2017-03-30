class Trip
  include Mongoid::Document
  include Mongoid::Timestamps

  field :name, type: String
  field :permalink, type: String
  field :start_date, type: Date
  field :end_date, type: Date

  belongs_to :user

  validates :name, presence: true
  validates :user, presence: true

  validate :validate_date_order

  before_create :generate_permalink!

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
