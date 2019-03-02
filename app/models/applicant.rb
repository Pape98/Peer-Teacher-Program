class Applicant < ActiveRecord::Base
  has_one_attached :resume
end
