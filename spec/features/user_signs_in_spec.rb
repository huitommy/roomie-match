require 'rails_helper'

feature 'user signs in' do
  before(:each) do
    @user = FactoryGirl.create(:user)
    visit root_path
  end

  scenario 'an existing user specifies a valid email and password' do
    fill_in 'Login', with: @user.email
    fill_in 'Password', with: @user.password
    click_button 'Sign In'

    expect(page).to have_content("Welcome Back")
    expect(page).to have_content("Sign Out")
  end

  scenario 'an existing user specifies a valid email and password' do
    fill_in 'Login', with: @user.username
    fill_in 'Password', with: @user.password
    click_button 'Sign In'

    expect(page).to have_content("Welcome Back")
    expect(page).to have_content("Sign Out")
  end

  scenario 'an existing email with the wrong password is denied access' do
    fill_in 'Login', with: 'incorrect@example.com'
    fill_in 'Password', with: @user.password
    click_button 'Sign In'

    expect(page).to have_content('Invalid login or password')
    expect(page).to_not have_content('Sign Out')
  end

  scenario 'an already authenticated user cannot re-sign' do
    fill_in 'Login', with: @user.email
    fill_in 'Password', with: @user.password
    click_button 'Sign In'
     
    visit new_user_session_path

    expect(page).to have_content('Sign Out')
    expect(page).to have_content('You are already signed in')
    expect(page).to_not have_content('Sign In')
  end
end
