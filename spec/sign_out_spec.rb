require 'rails_helper'

feature 'user signs out', %Q{
  As a signed-in user of the site
  I want to sign out
  So that other people can't use my account
} do

  scenario 'user signs out' do
    user = FactoryGirl.create(:user)

    sign_in_as(user)
    click_link "Sign Out"

    expect(page).to have_content "Signed out successfully"
  end
end
