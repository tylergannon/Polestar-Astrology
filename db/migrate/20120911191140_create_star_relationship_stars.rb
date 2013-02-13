class CreateStarRelationshipStars < ActiveRecord::Migration
  def change
    create_table :star_relationship_stars do |t|
      t.integer :star_relationship_id
      t.integer :star_id
      t.integer :palace_id
      t.boolean :required
      t.integer :member_id

      t.timestamps
    end
    add_index :star_relationship_stars, :star_relationship_id
    add_index :star_relationship_stars, [:star_id, :member_id, :palace_id], name: 'idx_srs_mega_index'
  end
end
