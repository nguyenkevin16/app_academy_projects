# == Schema Information
#
# Table name: cat_rental_requests
#
#  id         :integer          not null, primary key
#  cat_id     :integer          not null
#  start_date :date             not null
#  end_date   :date             not null
#  status     :string           default("PENDING"), not null
#  created_at :datetime
#  updated_at :datetime
#

class CatRentalRequest < ActiveRecord::Base
  before_validation :ensure_status
  validates :cat_id, :start_date, :end_date, :status, presence: true
  validates :status, inclusion: { in: ["PENDING", "APPROVED", "DENIED"] }
  # validate :overlapping_approved_requests?

  belongs_to :cat

  def overlapping_requests
    # binds = { start_date: self.start_date, end_date: self.end_date, cat_id: self.cat_id }
    # debugger
    # CatRentalRequest.find_by_sql(<<-SQL, [self.end_date, self.start_date, self.cat_id])
    #   SELECT
    #     *
    #   FROM
    #     cat_rental_requests
    #   WHERE
    #     (start_date >= #{self.end_date} OR end_date <= #{self.start_date}) AND cat_id = #{self.cat_id}
    # SQL

    requests = CatRentalRequest.where("(start_date <= ? OR end_date >= ?) AND cat_id = ?", self.end_date, self.start_date, self.cat_id)
  end

  #private
  def overlapping_approved_requests
    requests = overlapping_requests
    unless requests.nil?
      requests.where("status = 'Approved'")
    end
    requests
  end

  def overlapping_approved_requests?
    unless overlapping_approved_requests.empty?
      errors[:request] << "overlaps with an existing approved request"
    end
  end

  def ensure_status
    if status.nil?
      status = "PENDING"
    end
  end
end

# CatRentalRequest.create!(cat_id: 1, start_date: '2016-12-1', end_date: '2016-12-8', status = 'Approved')
