class AddCsClassesToApplicants < ActiveRecord::Migration[5.2]
  def change
    add_column :applicants, :csce_classes, :string, array:true
  end
end
