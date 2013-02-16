class AddOrdinalToStarRelationships < ActiveRecord::Migration
  def change
    add_column :star_relationships, :ordinal, :integer
    # add_index :star_relationships, [:palace_id, :member_id]
  end
end
