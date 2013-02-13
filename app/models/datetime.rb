
module DateTimeExtension
  def week_start
    @week_start ||= "Monday"
  end
  def week_start=(start)
    @week_start = start
  end
  def get_week
    start = clone
    start -= 1.day until start.strftime("%A")!= week_start
    (0..6).map{|i| start + i.days}
  end
end

DateTime.send(:include, DateTimeExtension)