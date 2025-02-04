class AddUserIdToTlcources < ActiveRecord::Migration[6.1]
  def change
    add_column :tlcources, :user_id, :integer
  end
end
