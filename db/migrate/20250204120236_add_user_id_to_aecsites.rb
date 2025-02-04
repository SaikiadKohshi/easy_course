class AddUserIdToAecsites < ActiveRecord::Migration[6.1]
  def change
    add_column :aecsites, :user_id, :integer
  end
end
