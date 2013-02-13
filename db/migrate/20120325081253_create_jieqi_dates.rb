class CreateJieqiDates < ActiveRecord::Migration
  def change
    create_table :jieqi_dates do |t|
      t.integer :jieqi_id
      t.datetime :start_date
      t.integer :hour
      t.timestamps
    end
    add_index :jieqi_dates, :start_date
  end
end
