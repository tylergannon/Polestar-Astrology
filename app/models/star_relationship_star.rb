class StarRelationshipStar < ActiveRecord::Base
  belongs_to :star_relationship
  belongs_to :star
  validates :star_relationship, presence: true
  validates :star, presence: true
  validates :member_id, presence: true
  validates :palace_id, presence: true
end
