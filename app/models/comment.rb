class Comment < ActiveRecord::Base
  belongs_to :commentable, polymorphic: true
  belongs_to :member
  
  def self.comments_for(member, resource)
    where(member_id: member.id, commentable_id: resource.id, commentable_type: resource.class.name)
  end
end
