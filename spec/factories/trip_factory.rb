FactoryGirl.define do
  factory :trip, class: Rover::Models::Trip do
    name 'Trip to Europe'
    user
  end
end
