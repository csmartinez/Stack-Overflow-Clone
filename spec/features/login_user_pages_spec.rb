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

  it "logs the user in" do
    visit root_path
    user = FactoryGirl.create(:user)
    click_on "Login"
    fill_in "Email", with: user.email
    fill_in "Password", with: user.password
    click_button "Log in"
    expect(page). to have_content "Signed in successfully."
  end

  it "deletes a user", js: true do
    visit root_path
    click_on "Sign up"
    fill_in "Email", with: Faker::Internet.email
    fill_in "Password", with: "password"
    fill_in "Password confirmation", with: "password"
    click_button "Sign up"
    click_on "Edit profile"
    click_button "Cancel my account"
    expect(page).to have_content "Bye! Your account has been successfully cancelled. We hope to see you again soon."
  end

end
