FactoryGirl.define do
  sequence :email do |n|
    "bill#{n}@planetary.org"
  end

  factory :user, class: Rover::Models::User do
    email
    password 'sciencerulez'
  end
end
