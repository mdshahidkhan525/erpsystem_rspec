class CreateFaculties < ActiveRecord::Migration[6.1]
  def change
    create_table :faculties do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :mobile
      t.string :subject
      t.string :subject_code

      t.timestamps
    end
  end
end
