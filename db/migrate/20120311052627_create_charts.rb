class CreateCharts < ActiveRecord::Migration
  def change
    create_table :charts do |t|
      t.datetime :solar_date
      t.integer :year_id
      t.integer :month_id
      t.integer :day_id
      t.integer :hour_id
      t.string :inner_element
      t.integer :lunar_year
      t.integer :lunar_month
      t.integer :day_of_month
      t.string :slug
      t.timestamps
    end
    
    add_index :charts, :slug, unique: true
    add_index :charts, :solar_date, unique: true
    add_index :charts, :year_id
    add_index :charts, :hour_id
  end
end
