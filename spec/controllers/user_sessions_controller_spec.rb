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
    it "redirects to the todo list path" do
      post :create, email: "mike@mike.com", password: "password1234"
      expect(response).to be_redirect
      expect(response).to redirect_to(todo_lists_path)
    end
  end

end
