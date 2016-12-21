require 'rails_helper'

begin
  GoalsController
rescue
  GoalsController = nil
end

RSpec.describe GoalsController, type: :controller do
  let (:luke) { User.create!(username: "luke", password: "skywalker") }

  describe "GET #new" do
    context "when logged in" do

      before do
        allow(controller).to receive(:current_user) { luke }
      end

      it "should render the new template" do
        get :new
        expect(response).to render_template("new")
      end
    end

    context "when logged out" do

      before do
        allow(controller).to receive(:current_user) { nil }
      end

      it "should redirect to log in page" do
        get :new
        expect(response).to redirect_to(new_sessions_url)
      end
    end
  end

  describe "POST #create" do
    context "when logged in" do

      before do
        allow(controller).to receive(:current_user) { luke }
      end

      context "With Valid Arguements" do
        before :each do
          post :create, goal: { body: "try hard!" }
        end

        it "should create a goal" do
          expect(Goal.last.body).to eq("try hard!")
        end

        it "should redirect_to goal show page" do
          expect(response).to redirect_to(goal_url(Goal.last))
        end
      end

      context "With Invalid Arguements" do
        before :each do
          post :create, goal: { body: "" }
        end

        it "should show flash errors" do
          expect(flash[:errors]).to be_present
        end

        it "should render new template" do
          expect(response).to render_template("new")
        end
      end
    end

    context "when logged out" do
      before do
        allow(controller).to receive(:current_user) { nil }
      end

      it "should redirect to log in page" do
        get :new
        expect(response).to redirect_to(new_sessions_url)
      end
    end
  end

  describe 'GET #index' do
    context 'when logged in' do
      before do
        allow(controller).to receive(:current_user) { luke }
      end

      it 'should render template :index' do
        get :index
        expect(response).to render_template("index")
      end
    end

    context 'when logged out' do
      before do
        allow(controller).to receive(:current_user) { nil }
      end

      it "should redirect to log in page" do
        get :new
        expect(response).to redirect_to(new_sessions_url)
      end
    end
  end

  describe 'GET #show' do
    create_luke_with_link

    context 'when logged in' do
      before do
        allow(controller).to receive(:current_user) { luke }
      end

      it 'should render template :show' do
        get :show, id: luke_link.id
        expect(response).to render_template("show")
      end
    end

    context 'when logged out' do
      before do
        allow(controller).to receive(:current_user) { nil }
      end

      it "should redirect to log in page" do
        get :new
        expect(response).to redirect_to(new_sessions_url)
      end
    end
  end
end
