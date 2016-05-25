require 'spec_helper'

describe User do
  let(:valid_attributes) {
    {
      first_name: "Mike",
      last_name: "Ulvila",
      email: "mike@mike.com",
      password: "mike1234",
      password_confirmation: "mike1234"
    }
  }
  context "validations" do
    let(:user) { User.new(valid_attributes) }

    before do
      User.create(valid_attributes)
    end

    it "requires an email" do
      expect(user).to validate_presence_of(:email)
    end

    it "requires a unique email" do
      expect(user).to validate_uniqueness_of(:email)
    end

    it "requires a unique email (case insensitive)" do
      user.email = "MIKE@MIKE.COM"
      expect(user).to validate_uniqueness_of(:email)
    end

  end

  describe "#downcase_email" do
    it "makes the email attribute lower case" do
      user = User.new(valid_attributes.merge(email: "MIKE@TEAM.COM"))
      #user.downcase_email
      #expect(user.email).to eq("mike@team.com")
      expect{ user.downcase_email }.to change{ user.email }.
        from("MIKE@TEAM.COM").
        to("mike@team.com")
    end

    it "downcases an email before saving" do
      user = User.new(valid_attributes)
      user.email = "MIKE@TEAM.COM"
      expect(user.save).to be_true
      expect(user.email).to eq("mike@team.com")
    end
  end
end
