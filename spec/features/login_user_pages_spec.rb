require 'rails_helper'

describe "the user login process" do
  it "creates a new user" do
    user = FactoryGirl.create(:user)
    visit root_path
    click_on "Sign up"
    fill_in "Email", with: Faker::Internet.email
    fill_in "Password", with: "password"
    fill_in "Password confirmation", with: "password"
    click_button "Sign up"
    expect(page). to have_content "Welcome! You have signed up successfully."
  end
end
