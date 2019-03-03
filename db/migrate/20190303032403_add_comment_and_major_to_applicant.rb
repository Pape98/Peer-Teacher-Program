class AddCommentAndMajorToApplicant < ActiveRecord::Migration[5.2]
  def change
    add_column :applicants, :comment, :text
  end
end
