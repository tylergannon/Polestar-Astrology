module StarRelationshipsHelper
  def star_relationship_label(star_relationship)
    val = star_relationship.all.map(&:star).map(&:full_name).join(', ')
    unless star_relationship.any.empty?
      val += " and any of " + star_relationship.any.map(&:star).map(&:full_name).join(', ')
    end
  end
end
