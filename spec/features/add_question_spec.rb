require 'rails_helper'

describe "the add a question process" do
  it "adds a new question" do
    visit root_path
    user = FactoryGirl.create(:user)
    click_on "Login"
    fill_in "Email", with: user.email
    fill_in "Password", with: user.password
    click_button "Log in"
    click_on "Add a Question"
    fill_in "Body", with: Faker::Lorem.words(rand(2..10)).join(' ')
    click_on "Create Question"
    expect(page).to have_content "Question Successfully Added"
  end
end
