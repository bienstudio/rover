FactoryGirl.define do
  factory :trip, class: Rover::Models::Trip do
    name 'Trip to Europe'
    user
    start_date { Date.today }
    end_date { Date.today + 7.weeks }
  end
end
