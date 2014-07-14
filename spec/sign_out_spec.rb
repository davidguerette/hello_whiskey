require 'rails_helper'

feature 'user signs out', %Q{
  As a signed-in user of the site
  I want to sign out
  So that other people can't use my account
} do

  scenario 'user signs out' do
    user = FactoryGirl.create(:user)

    visit new_user_session_path
    fill_in "Email", with: user.email
    fill_in "Password", with: user.password
    click_on "Sign In"

    click_link "Sign Out"

    expect(page).to have_content "Signed out successfully"
  end
end
