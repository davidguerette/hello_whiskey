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
    user = FactoryGirl.create(:user)

    visit root_path
    click_link 'Sign In'
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button 'Sign In'
    expect(page).to have_content('Welcome back!')
    expect(page).to have_content('Sign Out')
  end

  scenario 'a nonexistent email and password are entered' do
    visit root_path
    click_link 'Sign In'
    fill_in 'Email', with: 'test12345@test.com'
    fill_in 'Password', with: 'password123'
    click_button 'Sign In'

    expect(page).to have_content('Invalid email or password.')
    expect(page).to_not have_content('Welcome back!')
    expect(page).to_not have_content('Sign Out')
  end

  scenario 'incorrect email and password combination is entered' do
    user = FactoryGirl.create(:user)

    visit root_path
    click_link 'Sign In'
    fill_in 'Email', with: user.email
    fill_in 'Password', with: 'wrongpassword123'
    click_button 'Sign In'

    expect(page).to have_content('Invalid email or password.')
    expect(page).to_not have_content('Sign Out')
  end

  scenario 'user who is already signed in cannot re-authenticate' do
    user = FactoryGirl.create(:user)

    visit new_user_session_path
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button 'Sign In'

    expect(page).to have_content('Sign Out')
    expect(page).to_not have_content('Sign In')

    visit new_user_session_path
    expect(page).to have_content('You are already signed in.')
  end
end
