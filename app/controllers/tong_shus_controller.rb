class TongShusController < ApplicationController
  respond_to :html, :json
  helper_method :hour_pillar

  def index
    start_date = DateTime.parse("#{params[:year]} #{params[:month]}")
    @month = Chart.find_or_create(start_date)
    @last_month = @month.solar_date - 1.month
    @next_month = @month.solar_date + 1.month
    end_date = start_date + 1.month - 1.day
    start_date -= start_date.wday
    end_date += (6-end_date.wday)%6
    @days = (start_date..end_date).map{|date| Chart.find_or_create(date)}
    
    @jieqi_dates = JieqiDate.where("start_date > ?", (@month.solar_date-1.month)).order(:start_date).limit(6)
    jieqi_array = []
    (0..(@jieqi_dates.size-2)).each do |i|
      jieqi_array << {id: @jieqi_dates[i].id,
          title: "#{@jieqi_dates[i].chinese} #{@jieqi_dates[i].english} Qi Node",
          start: @jieqi_dates[i].start_date.strftime("%Y-%m-%d"),
          end: (@jieqi_dates[i+1].start_date-1.day).strftime("%Y-%m-%d"),
          color: 'gray',
          type: 'jiqei'
        }
    end
    
    respond_with @days do |format|
      format.json {
        render :json => (jieqi_array + @days.map{|day|
          {
            id: day.id,
            title: day.day.name.titleize,
            start: day.solar_date.strftime("%Y-%m-%d"),
            url: tong_shu_week_path(day.solar_date.strftime("%Y-%b-%d")),
            color: 'green',
            type: 'day_stem_branch'
          }
        }).flatten
      }
    end
  end
  
  def week_of
    date = DateTime.parse(Time.parse(params[:week] ? params[:week] : '00:00').to_s)
    @days = date.get_week.map{|t| Chart.find_or_create t}
  end
  
  def hour_pillar(day_stem, hour_branch)
    stem = Stem.named [%w(jia yi bing ding wu ji geng xin ren kui jia yi),
    %w(bing ding wu ji geng xin ren kui jia yi bing ding),
    %w(wu ji geng xin ren kui jia yi bing ding wu ji),
    %w(geng xin ren kui jia yi bing ding wu ji geng xin),
    %w(ren kui jia yi bing ding wu ji geng xin ren kui)][(day_stem.ordinal-1)%5][hour_branch.ordinal-1]
    
    Pillar.find_by_stem_and_branch stem, hour_branch
  end
end


module DateTimeExtension
  def week_start
    @week_start ||= "Monday"
  end
  def week_start=(start)
    @week_start = start
  end
  def get_week
    start = clone
    start -= 1.day until start.strftime("%A")== week_start
    (0..6).map{|i| start + i.days}
  end
end

DateTime.send(:include, DateTimeExtension)