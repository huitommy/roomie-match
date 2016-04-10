require "rails_helper"

feature "new user creates preference profile" do

  context "user is signed in" do
    before(:each) do
      user = FactoryGirl.create(:user)
      visit "/users/sign_in"
      fill_in "Login", with: user.email
      fill_in "Password", with: user.password
      click_on "Log in"
    end

    scenario "successfully creates profile" do
      dwelling = FactoryGirl.create(:dwelling)

      click_link "Create Profile"
      fill_in "First Name", with: "Evana"
      fill_in "Last Name", with: "Louden"
      fill_in "preference_date_of_birth", with: "2014/01/01"
      select "Female", from: "Gender"
      select "Yes", from: "Pets"
      select "Yes", from: "Smoking"
      select "Yes", from: "Drinking"
      select "Yes", from: "Music"
      select "Yes", from: "Vegetarian"
      select "Yes", from: "Cleanliness"
      select "Yes", from: "Parties"
      select "Yes", from: "Sports"
      click_on "Save Profile"

      expect(page).to have_content("Profile Created")
      expect(page).to have_content(dwelling.city)
      expect(page).to have_content(dwelling.bedrooms)
      expect(page).to have_content(dwelling.rent)
    end
  end
end
