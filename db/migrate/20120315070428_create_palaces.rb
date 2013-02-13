class CreatePalaces < ActiveRecord::Migration
  def change
    create_table :palaces do |t|
      t.string :name
      t.integer :ordinal
      t.string :slug
      t.timestamps
    end
  end
end
