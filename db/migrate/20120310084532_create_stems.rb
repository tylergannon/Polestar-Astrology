class CreateStems < ActiveRecord::Migration
  def change
    create_table :stems do |t|
      t.string :char
      t.string :pinyin
      t.string :yin_yang
      t.string :element
      t.string :slug
      t.string :normalized
      t.text :description
      t.integer :ordinal

      t.timestamps
    end
  end
end
