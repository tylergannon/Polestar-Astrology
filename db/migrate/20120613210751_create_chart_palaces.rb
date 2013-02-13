class CreateChartPalaces < ActiveRecord::Migration
  def change
    create_table :chart_palaces do |t|
      t.integer :chart_id
      t.integer :palace_id
      t.integer :location_id

      t.timestamps
    end
    add_index :chart_palaces, :chart_id
    add_index :chart_palaces, :palace_id
  end
end
