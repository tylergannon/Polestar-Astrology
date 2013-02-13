class Person < ActiveRecord::Base
  include Extensions::BsFriendlyId
  friendly_id :full_name
  belongs_to :member
  belongs_to :chart
  
  default_scope order(:last_name, :first_name)
  
  attr_accessor :year, :month, :day, :time
  
  validates :year, numericality: { :greater_than_or_equal_to => 1900, :less_than_or_equal_to => 2099 }
  validates :month, :numericality => { :greater_than_or_equal_to => 1, :less_than_or_equal_to => 12 }
  validates :day, :numericality => { :greater_than_or_equal_to => 1, :less_than_or_equal_to => 31 }
  
  validates :dob, :presence => true
  def full_name
    "#{first_name} #{last_name}"
  end
  
  def chart
    if super.nil?
      update_attributes chart: Chart.find_or_create(dob)
    end
    super
  end
  
  MONTHS = [['January', 1], ['February', 2], ['March', 3], ['April', 4], ['May', 5], ['June', 6], ['July', 7], ['August', 8], ['September', 9], ['October', 10], ['November', 11], ['December', 12]]
end
