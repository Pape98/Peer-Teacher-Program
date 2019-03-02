class AddResumeToApplicants < ActiveRecord::Migration[5.2]
  def change
    add_column :applicants, :resume, :text
  end
end
