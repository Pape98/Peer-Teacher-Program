class AddMajorToApplicant < ActiveRecord::Migration[5.2]
  def change
    add_column :applicants, :major, :string
  end
end
