# spec/features/goals_spec.rb

require 'spec_helper'
require 'rails_helper'

feature "the goal writing process" do
  before :each do
    sign_up_as_luke_skywalker
    sign_in_as_luke_skywalker
  end

  scenario "has a goal index page" do
    expect(page).to have_content("New User")
  end

end
