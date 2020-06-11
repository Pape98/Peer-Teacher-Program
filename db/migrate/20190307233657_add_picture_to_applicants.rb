class AddPictureToApplicants < ActiveRecord::Migration[5.2]
  def change
    add_column :applicants, :picture, :string
  end
end
