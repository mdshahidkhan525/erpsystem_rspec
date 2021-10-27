class AddPasswordToFaculties < ActiveRecord::Migration[6.1]
  def change
    add_column :faculties, :password, :string
  end
end
