class AddingTranscriptAndScheduleToApplicants < ActiveRecord::Migration[5.2]
  def change
    add_column :applicants, :transcript, :string
    add_column :applicants, :schedule, :string
  end
end
