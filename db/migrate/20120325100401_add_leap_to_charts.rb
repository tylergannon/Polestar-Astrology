class AddLeapToCharts < ActiveRecord::Migration
  def change
    add_column :charts, :leap, :boolean

  end
end
