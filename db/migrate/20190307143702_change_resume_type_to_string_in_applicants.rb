class ChangeResumeTypeToStringInApplicants < ActiveRecord::Migration[5.2]
  def change
    change_column :applicants, :comment, :string
  end
end
