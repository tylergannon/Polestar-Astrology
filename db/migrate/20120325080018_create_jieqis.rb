class CreateJieqis < ActiveRecord::Migration
  def change
    create_table :jieqis do |t|
      t.string :chinese
      t.string :pinyin
      t.string :english
      t.string :slug
      t.integer :solar_longitude
      t.integer :ordinal

      t.timestamps
    end
  end
end
