class Applicant < ActiveRecord::Base
  enum status: [:Pending,:Approved,:Denied,:Incomplete]
  serialize :csce_classes
end
