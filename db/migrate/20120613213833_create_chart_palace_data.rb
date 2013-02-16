class CreateChartPalaceData < ActiveRecord::Migration
  def up
    Chart.all.each do |chart|
      location = chart.ming

      (1..12).each do |i|
        ChartPalace.create(chart: chart, palace: Palace.send("_#{i}"), location: location)
        location = location.previous
      end
    end
  end

  def down
    ChartPalace.destroy_all
  end
end
