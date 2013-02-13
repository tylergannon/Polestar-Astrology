class JieqiDate < ActiveRecord::Base
  belongs_to :jieqi
  
  delegate :chinese, :english, :pinyin, :to => :jieqi
  
  def self.for_date_range(start_date, end_date)
    first = where("start_date <= ?", start_date).order('start_date asc').first
    last = where("start_date >= ?", end_date).order('start_date asc').first
    where("start_date >= ? and start_date <= ?", first.start_date, last.start_date).order(:start_date)
  end
end
