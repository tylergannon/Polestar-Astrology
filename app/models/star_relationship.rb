class StarRelationship < ActiveRecord::Base
  belongs_to :palace
  belongs_to :member
  
  has_many :star_relationship_stars, dependent: :destroy
  has_many :comments, as: :commentable
  
  def all
    star_relationship_stars.select{|t| t.required}
  end
  
  def all?(star)
    !all.select{|t| t.star == star}.empty?
  end
  
  def any?(star)
    !any.select{|t| t.star == star}.empty?
  end
  
  def any
    star_relationship_stars.select{|t| !t.required}
  end
  
  def stars
    star_relationship_stars.map(&:star)
  end
end
