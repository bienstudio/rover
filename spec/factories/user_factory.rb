FactoryGirl.define do
  sequence :email do |n|
    "bill#{n}@planetary.org"
  end

  factory :user do
    email
    password 'sciencerulez'
  end
end
