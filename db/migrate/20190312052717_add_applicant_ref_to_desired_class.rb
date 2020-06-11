class AddApplicantRefToDesiredClass < ActiveRecord::Migration[5.2]
  def change
    add_reference :desired_classes, :applicants, foreign_key: true, index: true
  end
end
