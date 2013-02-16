class Feedback < ActiveRecord::Base
  belongs_to :member
  validates :subject, presence: true
  validates :feedback, presence: true
end
