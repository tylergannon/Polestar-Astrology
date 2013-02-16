class CreateLunarYears < ActiveRecord::Migration
  def change
    create_table :lunar_years do |t|
      t.integer :year_number
      t.datetime :start_date
      t.string :yin_yang
      t.integer :hexagram_cycle_starting_point
      t.integer :days_in_year

      t.timestamps
    end
  end
end
