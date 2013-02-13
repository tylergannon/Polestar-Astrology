class LunarYear < ActiveRecord::Base
  
  def self.find_by_solar_year(year)
    where(year_number: (2698+year)).first
  end
  
  def self.seed
    LunarYear.destroy_all

    date = DateTime.parse("1900-01-31")
    chart = ChartRipper.rip(date)
    LunarYear.create! year_number: (2698+date.year), yin_yang: chart.year.branch.native_stem.yin_yang, start_date: chart.solar_date
    
    (1901..2039).each do |year|
      date = DateTime.parse("#{year}-01-01")
      chart = ChartRipper.rip(date)
      while chart.lunar_month != 1 || chart.day_of_month != 1 do
        date += 1.day
        puts "Checking #{date}"
        chart = ChartRipper.rip(date)
      end
      puts "Beginning of the year #{chart.solar_date.year} is on #{chart.solar_date.month}/#{chart.solar_date.day}"
      LunarYear.create! year_number: (2698+year), yin_yang: chart.year.branch.native_stem.yin_yang, start_date: chart.solar_date
      
    end

    LunarYear.find_by_solar_year(1900).update_attributes hexagram_cycle_starting_point: 12
    
    (1901..2039).each do |year_num|
      year = LunarYear.find_by_solar_year(year_num)
      prior_year = LunarYear.find_by_solar_year(year_num-1)
      days = ((year.start_date-prior_year.start_date)/(24*3600) - 1).to_i
      
      location_in_sequence = prior_year.hexagram_cycle_starting_point + 
                              days * (prior_year.yin_yang=='yang' ? 1 : -1) +
                              (year.yin_yang=='yang' ? 1 : -1)
      location_in_sequence = location_in_sequence % 72
      
      year.update_attributes hexagram_cycle_starting_point: location_in_sequence
    end
  end
end
