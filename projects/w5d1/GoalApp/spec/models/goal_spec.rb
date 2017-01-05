# == Schema Information
#
# Table name: goals
#
#  id         :integer          not null, primary key
#  body       :text             not null
#  user_id    :integer          not null
#  privacy    :boolean          default("true"), not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  complete   :boolean          default("false"), not null
#

require 'rails_helper'

RSpec.describe Goal, type: :model do

  describe "validations" do
    it { should validate_presence_of(:body) }
    it { should validate_presence_of(:user) }
    it { should validate_presence_of(:privacy) }
    it { should validate_presence_of(:complete) }
  end

  describe "associations" do
    it { should belong_to(:user) }
  end


end
