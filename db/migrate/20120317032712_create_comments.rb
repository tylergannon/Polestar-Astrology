class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.integer :member_id
      t.integer :commentable_id
      t.string :commentable_type
      t.text :comments

      t.timestamps
    end
    add_index :comments, [:commentable_id, :commentable_type, :member_id], name: 'comments_finder_index'
  end
end
