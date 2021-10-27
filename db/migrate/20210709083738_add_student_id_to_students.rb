class AddStudentIdToStudents < ActiveRecord::Migration[6.1]
  def change
    add_column :students, :student_id, :integer
    add_index :students, :student_id
  end
end