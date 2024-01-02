class CreateRankings < ActiveRecord::Migration[7.1]
  def change
    create_table :rankings do |t|
      t.string :type
      t.references :project, null: false, foreign_key: true
      t.integer :num, null: false

      t.timestamps
    end
    add_index :rankings, :num, unique: true
  end
end
