module StarRelationshipsHelper
  def star_select
    content_tag('select', id: "select_star", class: "input input-medium") do
      val = content_tag('option', value: '') {'Choose One'}
      Star.all.each do |star|
        val += content_tag('option', value: star.friendly_id, data: {id: star.id}) {star.english}
      end
      val
    end
  end
  
  
  def star_relationship_label(star_relationship)
    val = star_relationship.all.map(&:star).map(&:full_name).join(', ')
    unless star_relationship.any.empty?
      val += " and any of " + star_relationship.any.map(&:star).map(&:full_name).join(', ')
    end
  end
end
