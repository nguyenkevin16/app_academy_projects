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

FactoryGirl.define do
  factory :goal do
    
  end
end
