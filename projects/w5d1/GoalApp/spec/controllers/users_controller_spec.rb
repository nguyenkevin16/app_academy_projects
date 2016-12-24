require 'rails_helper'

RSpec.describe UsersController, type: :controller do

  describe "GET #new" do
    it "should render the new template" do
      get :new
      expect(response).to render_template("new")
    end
  end

  describe "POST #create" do
    context "With Valid Arguements" do
      before :each do
        post :create, user: { username: "luke", password: "skywalker" }
      end

      it "should log in the user" do
        expect(User.last.session_token).to eq(session[:session_token])
      end

      it "should create a user" do
        expect(User.last.username).to eq("luke")
      end
    end

    context "With Invalid Arguements" do
      before :each do
        post :create, user: { username: "luke", password: "sky" }
      end

      it "should show flash errors" do
        expect(flash[:errors]).to be_present
      end

      it "should render new template" do
        expect(response).to render_template("new")
      end
    end
  end
end
