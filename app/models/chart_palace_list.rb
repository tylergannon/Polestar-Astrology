class ChartPalaceList < Array
  def self.build_with_ming(chart, ming_branch)
    arr = []
    location = ming_branch
    
    (1..12).each do |i|
      arr << ChartPalace.new(palace: Palace.send("_#{i}"), location: location)
      location = location.previous
    end
    arr = ChartPalaceList.new(arr)
    
    Star.all_stars.each do |star|
      arr.by_location(chart.send(star.symbol_name)).stars << star
    end
    arr
  end
  
  def self.build(chart)
    build_with_ming(chart, chart.ming)
  end
  
  def [](indexer)
    if indexer.kind_of?(Branch)
      by_location(indexer)
    elsif indexer.kind_of?(String) || indexer.kind_of?(Symbol)
      by_location(Branch.by_name(indexer))
    else
      palace(indexer)
    end
  end
  
  def by_location(branch)
    select{|t| t.location == branch}.first
  end
  
  def palace(i)
    select{|t| t.palace.ordinal==i}.first
  end
end
