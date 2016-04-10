require 'rails_helper'

feature 'sign up' do
  scenario 'a new user specfies a valid username, gender, birthdate, email and password' do
    visit root_path
    click_link "Sign Up"
    fill_in "Username", with: 'User1'
    fill_in "Email", with: 'user@example.com'
    fill_in 'Password', with: 'password'
    fill_in 'Password Confirmation', with: 'password'
    click_button 'Sign Up'

    expect(page).to have_content("Account created")
    expect(page).to have_content('Sign Out')
  end

  scenario 'required information is not supplied' do
    visit root_path
    click_link 'Sign Up'
    click_button 'Sign Up'

    expect(page).to have_content("can't be blank")
    expect(page).to_not have_content("Sign Out")
  end

  scenario 'password confirmation does not match password' do
    visit root_path
    click_link 'Sign Up'
    fill_in "Username", with: 'User1'
    fill_in "Email", with: 'user@example.com'
    fill_in 'Password', with: 'password'
    fill_in 'Password Confirmation', with: 'notpassword'

    click_button 'Sign Up'
    expect(page).to have_content("doesn't match")
    expect(page).to have_content("Log in")
  end
end
