class CreateProjects < ActiveRecord::Migration[7.1]
  def change
    create_table :projects do |t|
      t.string :code
      t.string :secret

      t.timestamps
    end
    add_index :projects, :code, unique: true
  end
end
