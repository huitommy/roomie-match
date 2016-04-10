require 'factory_girl'

FactoryGirl.define do
  factory :user do
    sequence(:username) { |n| "user#{n}" }
    sequence(:email) { |n| "email#{n}@email.com" }
    password "password"
  end

  factory :preference do
    pets "false"
    smoking "0"
    drinking "0"
    music "0"
    vegetarian "0"
    cleanliness "0"
    parties "0"
    sports "0"
    user
    dwelling
  end

  factory :dwelling do
    address "Address St."
    city "testcity"
    state "teststate"
    zip_code "00000"
    type
    bedrooms
    bathrooms
    sq_ft
    rent
    parking
  end

  factory :admin do
    sequence(:email) { |n| "admin#{n}@admins.com" }
    password "password"
  end
end
