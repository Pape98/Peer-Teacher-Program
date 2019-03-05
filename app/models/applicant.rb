class Applicant < ActiveRecord::Base
  enum status: [:Pending,:Approved,:Denied,:Incomplete]
  has_one_attached :resume
end
