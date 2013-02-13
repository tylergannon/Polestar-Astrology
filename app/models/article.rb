class Article < ActiveRecord::Base
  include Extensions::BsFriendlyId
  friendly_id :title
  
  default_scope order('date_posted desc')
end
