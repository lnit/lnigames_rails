class CreatePointRankItems < ActiveRecord::Migration[7.1]
  def change
    create_table :point_rank_items do |t|
      t.references :ranking, null: false, foreign_key: true
      t.integer :score, null:false
      t.string :name
      t.string :user_hash

      t.timestamps
    end
    add_index :point_rank_items, :user_hash, unique: true
  end
end
