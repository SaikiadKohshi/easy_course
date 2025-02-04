class AddUserIdToTchcourcelists < ActiveRecord::Migration[6.1]
  def change
    add_column :tchcourcelists, :user_id, :integer
  end
end
