require 'spec_helper'

describe User do
  let(:valid_attributes) {
    {
      first_name: "Mike",
      last_name: "Ulvila",
      email: "mike@mike.com"
    }
  }
  context "validations" do
    let(:user) { User.new(valid_attributes) }

    it "requires an email" do
      expect(user).to validate_presence_of(:email)
    end

    it "requires a unique email" do
      expect(user).to validate_uniqueness_of(:email)
    end

  end
end
