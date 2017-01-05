# spec/features/goals_spec.rb

require 'spec_helper'
require 'rails_helper'

feature "viewing goals" do
  before :each do
    sign_up_as_luke_skywalker
    sign_in_as_luke_skywalker
  end

  scenario "has a goal index page" do
    visit goals_url
    expect(page).to have_content("Goals")
  end

  scenario "has a button to create goal" do
    visit goals_url
    expect(page).to have_button("Create goal")
  end
end

feature "creating goals" do
  before :each do
    sign_up_as_luke_skywalker
    sign_in_as_luke_skywalker
    visit goals_url
    click_button "Create goal"
  end

  scenario "create goal button takes you to new goal form" do
    expect(page).to have_content("New Goal")
  end

  scenario "shows new goal on index" do
    fill_in "body", with: "dummy goal"
    click_button "Submit"
    expect(page).to have_content("dummy goal")
  end

  scenario "returns to new goal form with empty body" do
    click_button "Submit"
    expect(page).to have_content("New Goal")
  end
end

feature "removing goals" do
  before :each do
    sign_up_as_luke_skywalker
    sign_in_as_luke_skywalker
    visit goals_url
    click_button "Create goal"
    fill_in "body", with: "test"
    click_button "Submit"
  end

  scenario "index should show new goal" do
    expect(page).to have_content("test")
  end

  scenario "goal page should show remove button" do
    expect(page).to have_button("Remove Goal")
  end

  scenario "returns to new goal form with empty body" do
    click_button "Remove Goal"
    expect(page).to_not have_content("test")
  end
end
