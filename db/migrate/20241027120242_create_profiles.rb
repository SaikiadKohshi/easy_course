class CreateProfiles < ActiveRecord::Migration[6.1]
  def change
    create_table :profiles do |t|
      t.string :nickname
      t.string :age
      t.string :birthday
      t.string :hometown
      t.string :college
      t.text :character

      t.timestamps
    end
  end
end
