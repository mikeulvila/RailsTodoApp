require "spec_helper"

describe "Logging In" do
  it "displays an email address in the event of a failed login" do
    visit new_user_session_path
    fill_in "Email", with: "mike@mike.com"
    fill_in "Password", with: "hello"
    click_button "Log In"

    expect(page).to have_content("Please check your email and password")
    expect(page).to have_field("Email", with: "mike@mike.com")
  end
end
