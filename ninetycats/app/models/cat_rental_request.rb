# == Schema Information
#
# Table name: cat_rental_requests
#
#  id         :integer          not null, primary key
#  cat_id     :integer          not null
#  start_date :date             not null
#  end_date   :date             not null
#  status     :string           default("PENDING"), not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class CatRentalRequest < ApplicationRecord
  validates :cat_id, :start_date, :end_date, :status, presence: true
  validates :status, inclusion: { in: %w(PENDING APPROVED DENIED), message: "Not a valid status" }
  validate :does_not_overlap_approved_request

  belongs_to :cat,
    primary_key: :id,
    foreign_key: :cat_id,
    class_name: 'Cat'


  private

  def overlapping_requests
    check_overlap = CatRentalRequest.where("start_date BETWEEN ? AND ? OR end_date BETWEEN ? AND ?", self.start_date, self.end_date , self.start_date, self.end_date)
    # full_check = check_overlap.where("start_date < ? AND end_date > ?", self.start_date, self.end_date)
    with_cat = check_overlap.where("cat_id = ?", self.cat_id)
    with_cat
  end

  def overlapping_approved_requests
    overlapping_requests.where(status: 'APPROVED')
  end

  def does_not_overlap_approved_request
    if overlapping_approved_requests.exists?
      errors[:overlapping] << "There is an overlapping request"
    end
  end

end
