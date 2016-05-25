require 'spec_helper'

describe UserSessionsController do

  describe "GET 'new'" do
    it "returns http success" do
      get 'new'
      response.should be_success
    end

    it "renders the new template" do
      get 'new'
      expect(response).to render_template('new')
    end
  end

  describe "POST 'create'" do
    context "with correct credentials" do
      let!(:user) { User.create(first_name: "Mike", last_name: "Ulvila",
                                email: "mike@mike.com", password: "password1234",
                                password_confirmation: "password1234") }

      it "redirects to the todo list path" do
        post :create, email: "mike@mike.com", password: "password1234"
        expect(response).to be_redirect
        expect(response).to redirect_to(todo_lists_path)
      end

      it "finds the user" do
        expect(User).to receive(:find_by).with({email: "mike@mike.com"}).and_return(user)
        post :create, email: "mike@mike.com", password: "password1234"
      end

      it "authenticates the user" do
        User.stub(:find_by).and_return(user)
        expect(user).to receive(:authenticate)
        post :create, email: "mike@mike.com", password: "password1234"
      end

      it "sets the user_id in the session" do
        post :create, email: "mike@mike.com", password: "password1234"
        expect(session[:user_id]).to eq(user.id)
      end

    end
  end

end
