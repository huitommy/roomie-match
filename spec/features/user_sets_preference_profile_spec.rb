require 'rails_helper'

feature 'new user creates preference profile' do

  context "user is signed in" do
    before(:each) do
      user = FactoryGirl.create(:user)
      visit '/users/sign_in'
      fill_in 'Email', with: user.email
      fill_in 'Password', with: user.password
      click_on 'Log in'
    end

    scenario 'successfully creates profile' do
      dwelling = FactoryGirl.create(:dwelling)

      click_link 'Create Profile'
      select 'Yes', from: 'Pets'
      select 'Yes', from: 'Smoking'
      select 'Yes', from: 'Drinking'
      select 'Yes', from: 'Music'
      select 'Yes', from: 'Vegetarian'
      select 'Yes', from: 'Cleanliness'
      select 'Yes', from: 'Parties'
      select 'Yes', from: 'Sports'
      click_on 'Save Profile'

      expect(page).to have_content('Profile Created')
      expect(page).to have_content('dwelling.city')
      expect(page).to have_content('dwelling.bedrooms')
      expect(page).to have_content('dwelling.rent')
    end

  #   scenario 'User visits page with new elevader form and fills out incorrectly' do
  #     click_link 'Add Elevator'
  #     fill_in 'Address', with: 'test street'
  #     fill_in 'City', with: 'teston'
  #     fill_in 'Zipcode', with: '02142'
  #     fill_in 'State', with: 'ta'
  #     click_on 'Create Elevator'
  #
  #     expect(page).to have_content("Building name can't be blank")
  #     expect(page).to_not have_content('test')
  #     expect(page).to have_selector("input[value='test street']")
  #     expect(page).to have_selector("input[value='ta']")
  #     expect(page).to have_selector("input[value ='02142']")
  #   end
  # end
  #
  # scenario 'User is not logged in and tries to submit a new elevator form' do
  #   visit '/'
  #   click_link 'Add Elevator'
  #
  #   expect(page).to have_content('You need to sign in or sign up before continuing.')
    # end
  end
end
