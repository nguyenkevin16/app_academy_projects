# spec/features/auth_spec.rb

require 'spec_helper'
require 'rails_helper'

feature "the signup process" do
  before :each do
    visit new_user_url
  end

  scenario "has a new user page" do
    expect(page).to have_content("New User")
  end

  feature "signing up a user" do
    scenario "shows username on the homepage after signup" do
      sign_up_as_hairy_potter
      expect(page).to have_content "hairy_potter"
    end
  end

end

feature "logging in" do

  scenario "shows username on the homepage after login" do
    sign_up_as_hairy_potter
    visit new_sessions_path

    fill_in "Username", with: 'hairy_potter'
    fill_in "Password", with: 'abcdef'
    click_button "Sign In"

    expect(page).to have_content "hairy_potter"
  end
end

feature "logging out" do

  scenario "begins with a logged out state" do
    visit new_sessions_path
    expect(page).to have_link("Sign In")
    expect(page).to have_link("Sign Up")
  end

  scenario "doesn't show username on the homepage after logout" do
    visit new_sessions_path
    expect(page).to_not have_content("hairy_potter")
  end

end
