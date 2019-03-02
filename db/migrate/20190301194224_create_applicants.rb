class CreateApplicants < ActiveRecord::Migration[5.2]
  def change
    create_table :applicants do |t|
      #Personal Information
      t.string  :first_name
      t.string  :last_name
      t.string  :email
      t.string  :uin
      t.string  :phone_number
      t.string  :graduation_date
      t.string  :gpa

      # #School Information
      # t.string  :major
      # t.string  :csce_class
      # #Addtional Information
      # t.text    :comment

      t.timestamps
    end
  end
end
