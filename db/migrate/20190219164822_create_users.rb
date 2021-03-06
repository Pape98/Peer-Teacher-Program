class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    puts 'creating users'
    create_table :users do |t|
      t.string :email
      t.string :password_digest
      t.string  :first_name
      t.string  :last_name
      # Add fields that let Rails automatically keep track
      # of when movies are added or modified:
      t.timestamps
    end
  end
end
