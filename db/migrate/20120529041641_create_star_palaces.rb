class CreateStarPalaces < ActiveRecord::Migration
  def change
    create_table :star_palaces do |t|
      t.integer :star_id
      t.integer :palace_id
      t.string :slug

      t.timestamps
    end
  end
end
