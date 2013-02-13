class AddChartIdToPeople < ActiveRecord::Migration
  def change
    add_column :people, :chart_id, :integer

  end
end
