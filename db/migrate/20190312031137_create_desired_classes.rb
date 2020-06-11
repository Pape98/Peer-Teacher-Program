class CreateDesiredClasses < ActiveRecord::Migration[5.2]
  def change
    create_table :desired_classes, :id => false do |t|
      t.integer :student_id,  :null => false
      t.string :csce_class

      t.timestamps
    end
  end
end
