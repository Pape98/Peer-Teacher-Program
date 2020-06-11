class AddAdminCommentToApplicants < ActiveRecord::Migration[5.2]
  def change
    add_column :applicants, :admin_comment, :text
  end
end
