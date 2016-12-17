require 'rails_helper'

RSpec.describe User, type: :model do
  subject(:user) { User.create(username: "luke", password: "skywalker") }

  it { should validate_presence_of(:username) }
  it { should validate_presence_of(:password_digest) }
  it { should validate_presence_of(:session_token) }
  it { should validate_length_of(:password).is_at_least(6) }

  it { should have_many(:subs) }
  it { should have_many(:posts) }
  it { should have_many(:posted_subs) }

  describe "#password=" do
    it "should create a password_digest" do
      expect(user.password_digest).to_not be_nil
    end
  end

  describe "#is_password?" do
    it "should return true for correct password" do
      expect(user.is_password?("skywalker")).to be_truthy
    end

    it "should return false for wrong password" do
      expect(user.is_password?("jabba")).to be_falsey
    end
  end

  describe "#ensure_session_token" do
    it "creates a session token" do
      expect(user.session_token).to_not be_nil
    end
  end

  describe "#reset_session_token!" do
    it "should reset the session token" do
      old_session_token = user.session_token
      user.reset_session_token!
      expect(user.session_token).to_not eq(old_session_token)
    end

    it "should return the new session token" do
      expect(user.reset_session_token!).to eq(user.session_token)
    end
  end

  describe "::find_by_credentials" do
    before { user.save! }

    it "returns user given good credentials" do
      expect(User.find_by_credentials("luke", "skywalker")).to eq(user)
    end

    it "returns nil given bad credentials" do
      expect(User.find_by_credentials("luke", "jabba")).to eq(nil)
    end
  end
end
