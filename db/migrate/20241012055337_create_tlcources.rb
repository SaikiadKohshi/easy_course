class CreateTlcources < ActiveRecord::Migration[6.1]
  def change
    create_table :tlcources do |t|
      t.string :lecture
      t.string :professor
      t.float :reputation
      t.text :grade
      t.text :reportage

      t.timestamps
    end
  end
end
