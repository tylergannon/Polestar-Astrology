class Article < ActiveRecord::Base
  extend FriendlyId
  friendly_id :title, use: :finders
  
  default_scope -> {order('date_posted desc')}
end
