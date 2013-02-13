class CreateBranches < ActiveRecord::Migration
  def change
    create_table :branches do |t|
      t.string :char
      t.string :pinyin
      t.string :animal
      t.integer :native_stem_id
      t.string :normalized
      t.integer :hour
      t.integer :month
      t.string :slug
      t.text :description
      t.integer :ordinal
      t.timestamps
    end
  end
end
