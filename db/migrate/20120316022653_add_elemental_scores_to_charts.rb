class AddElementalScoresToCharts < ActiveRecord::Migration
  def change
    add_column :charts, :wood_score, :integer

    add_column :charts, :fire_score, :integer

    add_column :charts, :earth_score, :integer

    add_column :charts, :metal_score, :integer

    add_column :charts, :water_score, :integer

  end
end
