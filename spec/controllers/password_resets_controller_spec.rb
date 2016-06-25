require 'spec_helper'

describe PasswordResetsController do
  describe "GET new" do
    it "renders the new template" do
      get :new
      expect(response).to render_template('new')
    end
  end

  describe "POST create" do
    context "with a valid user and email" do
      let(:user) {create(:user)}

      it "finds the user" do
        expect(User).to receive(:find_by).with(email: user.email)
        post :create, email: user.email
      end

      it "generates a new password reset token" do

      end
    end
  end

end
