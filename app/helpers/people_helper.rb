module PeopleHelper
  def borrowed_stars(palace)
    @chart.palaces[palace.location.diametric].major_stars.sort_by_rank
  end
  
  def major_stars(palace)
    palace.major_stars.sort_by_rank
  end
  
  def minor_stars(palace)
    palace.minor_stars.sort_by_rank
  end
  
  def comments_for_star_in_chart_palace(star, chart_palace)
    chart_palace.my_star_relationships(current_member, star).map{|star_relationship|
      
    }
  end
end

