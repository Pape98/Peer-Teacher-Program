class RemoveStudentIdFromDesiredClasses < ActiveRecord::Migration[5.2]
  def change
    remove_column :desired_classes, :student_id, :integer
  end
end
