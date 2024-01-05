class CreatePointRankItems < ActiveRecord::Migration[7.1]
  def change
    create_table :point_rank_items do |t|
      t.references :ranking_board, null: false, foreign_key: true
      t.integer :score, null: false, index: true
      t.string :name
      t.string :uid, null: false

      t.timestamps
    end
    add_index :point_rank_items, :uid, unique: true
    add_index :point_rank_items, :updated_at
  end
end
