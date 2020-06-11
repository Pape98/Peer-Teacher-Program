class Applicant < ActiveRecord::Base
  enum status: [:Pending,:Approved,:Denied,:Incomplete]
  serialize :csce_classes

  def self.all_status
    %w(Pending Approved Denied Incomplete)
  end
end
