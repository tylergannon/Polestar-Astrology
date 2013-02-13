class CreateStarRelationships < ActiveRecord::Migration
  def change
    create_table :star_relationships do |t|
      t.integer :palace_id
      t.integer :member_id
      t.timestamps
    end
    add_index :star_relationships, [:palace_id, :member_id]
  end
end
