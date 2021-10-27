class CreateAssignments < ActiveRecord::Migration[6.1]
  def change
    create_table :assignments do |t|
      t.integer :no
      t.text :hindi
      t.text :english
      t.text :maths
      t.text :science
      t.text :social_science

      t.timestamps
    end
  end
end
