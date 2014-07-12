require 'rails_helper'

feature 'user can sign up for account', %Q{
  As an unauthenticated lover of fine whiskey cocktails
  I’d like to create a user account
  So that I can keep track of my favorite drink recipes

  *******Acceptance Criteria*****************************
  -I must enter a valid email address
  -I must enter a password and password confirmation
  -If I do not perform the steps above, I receive an error message
  -If I enter valid information, I register my account and am authenticated
} do

  scenario 'specifies valid required information' do
    visit root_path
    click_link 'Sign Up'
    fill_in 'First Name', with: 'Bob'
    fill_in 'Last Name', with: 'Smith'
    fill_in 'Email', with: 'user@example.com'
    fill_in 'user_password', with: 'password123'
    fill_in 'Password Confirmation', with: 'password123'
    click_button 'Sign Up'

    expect(page).to have_content('Login successful.')
    expect(page).to have_content('Sign Out')

  end

  scenario 'does not enter required information'

  scenario 'password confirmation does not match password'
end
