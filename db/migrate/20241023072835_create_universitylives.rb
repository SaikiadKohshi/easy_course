class CreateUniversitylives < ActiveRecord::Migration[6.1]
  def change
    create_table :universitylives do |t|
      t.text :selsect
      t.text :study
      t.text :parttimejob
      t.text :circle
      t.text :daily
      t.text :intern

      t.timestamps
    end
  end
end
