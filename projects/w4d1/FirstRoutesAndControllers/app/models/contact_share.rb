# == Schema Information
#
# Table name: contact_shares
#
#  id            :integer          not null, primary key
#  contact_id    :integer          not null
#  share_with_id :integer          not null
#  created_at    :datetime
#  updated_at    :datetime
#

class ContactShare < ActiveRecord::Base
  validates :contact_id, :share_with_id, presence: true
  validates :share_with_id, uniqueness: { scope: :contact_id }

  belongs_to :user,
    primary_key: :id,
    foreign_key: :share_with_id,
    class_name: :User

  belongs_to :contact,
    primary_key: :id,
    foreign_key: :contact_id,
    class_name: :Contact
end
