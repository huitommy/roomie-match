require 'factory_girl'

FactoryGirl.define do
  factory :user do
    username "user"
    email "user@gmail.com"
    password "password"
  end

  factory :preference do
    first_name "Evana"
    last_name "Louden"
    gender "Female"
    date_of_birth "01/01/1945"
    pets "false"
    smoking "1"
    drinking "0"
    music "0"
    vegetarian "1"
    cleanliness "0"
    parties "0"
    sports "0"
    user
    dwelling
  end

  factory :dwelling do
    address "Address at."
    city "testcity"
    state "teststate"
    zip_code "00000"
    category "Apartment"
    bedrooms "2"
    bathrooms "1.5"
    sq_ft "777"
    rent "1000"
    parking true
  end

  factory :admin do
    sequence(:email) { |n| "admin#{n}@admins.com" }
    password "password"
  end
end
