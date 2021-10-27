class CreateStudents < ActiveRecord::Migration[6.1]
  def change
    create_table :students do |t|
      t.string :first_name
      t.string :last_name
      t.string :father_name
      t.string :roll_no
      t.string :email_id
      t.string :student_class
      t.string :password
      t.string :mobile

      t.timestamps
    end
  end
end
