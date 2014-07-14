require 'rails_helper'

feature 'user signs in', %Q{

User can access their own user account

As a lover of fine whiskey cocktails
I want to sign in
So I can keep track of my favorite drinks

*******Acceptance Criteria*****************************
-If I specify a valid email email and password that has already been registered, I gain access to my user account.
-If I enter an invalid email and password I remain unauthenticated
-If I am already signed in, I can’t sign in again

} do

  scenario 'an existing user specifies a valid email and password' do
    FactoryGirl.create(:user)

    visit root_path
    click_link 'Sign in'
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    fill_in 'Password Confirmation', with: user.password_confirmation
    click_button 'Sign In'
    expect(page).to have_content('Welcome back!')
    expect(page).to have_content('Sign Out')
  end

end
