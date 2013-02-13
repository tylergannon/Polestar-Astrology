class CreateStars < ActiveRecord::Migration
  def change
    create_table :stars do |t|
      t.string :pinyin
      t.string :english
      t.string :description
      t.integer :rank
      t.string :slug
      t.timestamps
    end
  end
end
