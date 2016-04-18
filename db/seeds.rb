# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
options = [-1, 0, 1]
booleans = [true, false]
genders = ["Male", "Female", "Unsure"]
50.times do
user = FactoryGirl.create(:user)
Preference.create(
  pets: booleans.sample,
  smoking: options.sample,
  drinking: options.sample,
  music: options.sample,
  vegetarian: options.sample,
  cleanliness: options.sample,
  parties: options.sample,
  sports: options.sample,
  user: user,
  first_name: Faker::Name.first_name,
  last_name: Faker::Name.last_name,
  gender: genders.sample,
  date_of_birth: Faker::Date.backward(20000)
)
Dwelling.create(
  address: Faker::Address.street_address,
  city: Faker::Address.city,
  state: Faker::Address.state_abbr,
  zip_code: Faker::Address.zip,
  category: ["house", "apartment", "condo", "co-op", "townhouse"].sample,
  bedrooms: [1, 2, 3, 4, 5, 6].sample,
  bathrooms: [1, 2, 3].sample,
  sq_ft: [500, 1000, 1500, 2000].sample,
  rent: [500, 600, 700, 800, 900, 1000].sample,
  parking: booleans.sample
)
end
