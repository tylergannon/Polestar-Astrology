class StarPalace < ActiveRecord::Base
  belongs_to :star
  belongs_to :palace
  has_many :comments, as: :commentable

  def my_comments(member)
    @my_comments ||= comments.where(member_id: member.id)
  end
  
  def name
    star.pinyin + " " + palace.name
  end
end
