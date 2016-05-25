require "spec_helper"

describe "Signing up" do
  it "allows user to sign up and creates object in database" do
    expect(User.count).to eq(0)

    visit "/"
    expect(page).to have_content("Sign Up")
    click_link  "Sign Up"

    fill_in "First Name", with: "Mike"
    fill_in "Last Name", with: "Ulvila"
    fill_in "Email", with: "mike@mike.com"
    fill_in "Password", with: "password1234"
    fill_in "Password (again)", with: "password1234"
    click_button "Sign Up"

    expect(User.count).to eq(1)
  end

end
