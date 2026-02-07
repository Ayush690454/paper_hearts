class CreatePapers < ActiveRecord::Migration[8.1]
  def change
    create_table :papers do |t|
      t.text :content
      t.string :paper_type
      t.integer :x
      t.integer :y
      t.integer :rotation
      t.integer :z_index
      t.references :wall, null: false, foreign_key: true

      t.timestamps
    end
  end
end
