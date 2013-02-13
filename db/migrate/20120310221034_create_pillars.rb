class CreatePillars < ActiveRecord::Migration
  def change
    create_table :pillars do |t|
      t.integer :stem_id
      t.integer :branch_id
      t.string :slug
      t.text :description
      t.integer :ordinal

      t.timestamps
    end
  end
end
