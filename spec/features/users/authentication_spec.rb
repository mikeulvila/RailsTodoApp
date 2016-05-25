require "spec_helper"

describe "Logging In" do
  it "logs the user in and goes to the todo lists" do
    User.create(first_name: "Mike", last_name: "Ulvila",
                              email: "mike@mike.com", password: "password1234",
                              password_confirmation: "password1234")
    visit new_user_session_path
    fill_in "Email", with: "mike@mike.com"
    fill_in "Password", with: "password1234"
    click_button "Log In"
    expect(page).to have_content("Todo Lists")
    expect(page).to have_content("Thanks for logging in!")
  end

  it "displays an email address in the event of a failed login" do
    visit new_user_session_path
    fill_in "Email", with: "mike@mike.com"
    fill_in "Password", with: "hello"
    click_button "Log In"

    expect(page).to have_content("Please check your email and password")
    expect(page).to have_field("Email", with: "mike@mike.com")
  end
end
