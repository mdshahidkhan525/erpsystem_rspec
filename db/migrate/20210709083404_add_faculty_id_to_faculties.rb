class AddFacultyIdToFaculties < ActiveRecord::Migration[6.1]
  def change
    add_column :faculties, :faculty_id, :integer
    add_index :faculties, :faculty_id
  end
end
