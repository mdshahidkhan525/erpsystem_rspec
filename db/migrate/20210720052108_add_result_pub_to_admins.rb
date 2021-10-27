class AddResultPubToAdmins < ActiveRecord::Migration[6.1]
  def change
    add_column :admins, :result_pub, :boolean
  end
end
