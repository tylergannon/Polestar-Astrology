class AddLunarMonthNumberToCharts < ActiveRecord::Migration
  def change
    add_column :charts, :lunar_month_number, :integer

  end
end
