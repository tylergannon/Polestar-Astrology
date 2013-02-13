class CreateLunarDates < ActiveRecord::Migration
  def change
    create_table :lunar_dates do |t|
      t.date :gregorian_date
      t.integer :epoch
      t.integer :year_in_epoch
      t.integer :month_number
      t.boolean :leap_month
      t.integer :day_of_month

      t.timestamps
    end
    
    add_index :lunar_dates, :gregorian_date
  end
end
