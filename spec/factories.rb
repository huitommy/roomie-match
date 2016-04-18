require 'factory_girl'

FactoryGirl.define do
  factory :user do
    sequence(:username) { |n| "user#{n}" }
    sequence(:email) { |n| "user#{n}@gmail.com" }
    password "password"
  end

  factory :preference do
    first_name "John"
    last_name "Smith"
    gender "Male"
    date_of_birth "01/01/1945"
    pets true
    smoking [-1, 0, 1].sample
    drinking [-1, 0, 1].sample
    music [-1, 0, 1].sample
    vegetarian [-1, 0, 1].sample
    cleanliness [-1, 0, 1].sample
    parties [-1, 0, 1].sample
    sports [-1, 0, 1].sample
  end

  factory :admin do
    sequence(:email) { |n| "admin#{n}@admins.com" }
    password "password"
  end
end
