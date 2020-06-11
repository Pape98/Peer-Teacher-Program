class ChangeResumeTypeToStringAndCommentsToTextInApplicants < ActiveRecord::Migration[5.2]
  def change
    change_column :applicants, :comment, :text
    change_column :applicants, :resume, :string
  end
end
