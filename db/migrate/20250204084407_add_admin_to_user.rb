class AddAdminToUser < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :admin, :boolean , default: false #管理者権限は基本的に特定の人にしか付与しないので、作成されたマイグレーションファイルに「default: false」を追加します。 
  end
end
