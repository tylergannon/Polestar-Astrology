class Person < ActiveRecord::Base
  extend FriendlyId
  friendly_id :full_name, use: [:finders, :slugged]
  belongs_to :member
  belongs_to :chart
  
  default_scope ->{order(:last_name, :first_name)}
  
  before_validation do
    puts self.year.inspect
    
    if dob_changed? || year_branch_id.nil? || hour_branch_id.nil?
      self.chart = Chart.find_or_create(dob)
      self.year_branch_id = chart.year.branch_id
      self.hour_branch_id = chart.hour.branch_id
    end
  end
  
  def year_branch
    @year_branch ||= Branch.find(year_branch_id)
  end

  def hour_branch
    @hour_branch ||= Branch.find(hour_branch_id)
  end
    
  # validates :year, numericality: { :greater_than_or_equal_to => 1900, :less_than_or_equal_to => 2099 }
  # validates :month, :numericality => { :greater_than_or_equal_to => 1, :less_than_or_equal_to => 12 }
  # validates :day, :numericality => { :greater_than_or_equal_to => 1, :less_than_or_equal_to => 31 }
  
  validates :dob, :presence => true
  def full_name
    "#{first_name} #{last_name}"
  end
  
  def year
    dob.year if dob
  end
  
  def month
    dob.month if dob
  end
  
  def day
    dob.day if dob
  end
  
  def time
    dob
  end
    
  def chart
    if super.nil?
      update_attributes chart: Chart.find_or_create(dob)
    end
    super
  end
  
  MONTHS = [['January', 1], ['February', 2], ['March', 3], ['April', 4], ['May', 5], ['June', 6], ['July', 7], ['August', 8], ['September', 9], ['October', 10], ['November', 11], ['December', 12]]
end
