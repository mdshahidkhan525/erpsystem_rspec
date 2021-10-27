class CreateResults < ActiveRecord::Migration[6.1]
  def change
    create_table :results do |t|
      t.string :student_roll
      t.integer :hindi
      t.integer :english
      t.integer :maths
      t.integer :science
      t.integer :social_science
      t.integer :total
      t.integer :obtained_marks
      t.string :remark
      t.references :student, null: false, foreign_key: true

      t.timestamps
    end
  end
end
