module ChartPalacesHelper
  def star_relationship_string(star_relationship)
    val = star_names(star_relationship.all).to_english_list
    unless star_relationship.any.empty?
      val += ", with " + star_names(star_relationship.all).to_english_list('or')
    end
    val += " in the #{star_relationship.palace.name} Palace"
  end
  
  def star_names(star_relationship_stars)
    star_relationship_stars.map{|s| s.star.pinyin}
  end
end
