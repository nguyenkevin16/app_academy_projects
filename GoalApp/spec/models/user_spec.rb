# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  username        :string           not null
#  password_digest :string           not null
#  session_token   :string           not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

require 'rails_helper'

RSpec.describe User, type: :model do

  it { should validate_presence_of(:username) }
  it { should validate_presence_of(:password_digest) }
  it { should validate_presence_of(:session_token) }
  it { should have_many(:goals)}
  it { should validate_length_of(:password).is_at_least(6) }

  before :each do
    @user = User.create(username: "luke", password: "skywalker")
  end

  describe "password methods" do
    it "should set the password_digest" do
      expect(@user.password_digest).to_not be_falsey
    end

    it "should return true for valid password" do
      expect(@user.is_password?("skywalker")).to be_truthy
    end

    it "should return false for invalid password" do
      expect(@user.is_password?("jabba")).to be_falsey
    end
  end

  describe "#reset_session_token!" do
    it "should return a different session_token" do
      original_session_token = @user.session_token
      expect(@user.reset_session_token!).to_not eq(original_session_token)
    end
  end

  describe "::find_by_credentials" do
    it "should return nil for invalid credentials" do
      expect(User.find_by_credentials("han", "solosolo")).to be_nil
    end

    it "should return user for valid credentials" do
      # user = User.create(username: "luke", password: "skywalker")
      expect(User.find_by_credentials("luke", "skywalker")).to eq(@user)
    end
  end

end
