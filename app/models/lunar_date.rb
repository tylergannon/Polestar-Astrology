class LunarDate < ActiveRecord::Base
  attr_accessor :date_time
  cattr_accessor :_lookup
  self._lookup = ExecJS.compile(File.read("app/assets/javascripts/lunar_date.min.js"))

  def self.lookup(y, m, d, h)
    _lookup.call 'getLunarDate', y, m, d, h
  end
  
  def self.from_date_time(d)
    date = d.to_date
    ld = LunarDate.where(gregorian_date: date).first
    ld.date_time = d
    return ld
  end

  def as_json(unused=nil)
    {
      year: year_pillar.as_json,
      month: month_pillar.as_json,
      day: day_pillar.as_json,
      hour: hour_pillar.as_json,
      day_of_month: day_of_month,
      lunar_year: lunar_year,
      leap_month: leap_month,
      solar_date: gregorian_date.strftime("%Y-%m-%d %H:%M")
    }
  end
  
  def year_pillar
    @year_pillar ||= Pillar.send("_#{year_in_epoch}")
  end
  
  def month_pillar
    @month_pillar ||= lambda {
      stem_id = MONTH_STEM_LOOKUP[year_pillar.id % 5][month_number - 1]
      branch_id = [0, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 1, 2][month_number]
      Pillar.by_stem_and_branch(stem_id, branch_id)
    }.call
  end
  
  def day_pillar
    @day_pillar ||= lambda {
      days = days_since(gregorian_date)
      Pillar.send("_#{(days % 60) + 1}")
    }.call
  end
  
  def lunar_year
    (epoch * 60) + 1 + year_in_epoch
  end
  
  DATE = Date.parse("1924-04-15")
  
  def days_since(d)
    if d.kind_of?(String)
      d = Date.parse(d)
    end
    (d - DATE).to_i
  end
  
  def hour_pillar
    @hour_pillar ||= lambda {
      hour_num = ((date_time.hour + 1) / 2) % 12 + 1
      hour_branch = Branch[hour_num]

      stem = Stem.named [%w(jia yi bing ding wu ji geng xin ren kui jia yi),
      %w(bing ding wu ji geng xin ren kui jia yi bing ding),
      %w(wu ji geng xin ren kui jia yi bing ding wu ji),
      %w(geng xin ren kui jia yi bing ding wu ji geng xin),
      %w(ren kui jia yi bing ding wu ji geng xin ren kui)][(day_pillar.stem.ordinal-1)%5][hour_branch.ordinal-1]

      Pillar.find_by_stem_and_branch stem, hour_branch
    }.call
  end
    
  MONTH_STEM_LOOKUP = {
    0 => [1,	2,	3,	4,	5,	6,	7,	8,	9,	10,	1,	2],
    1 => [3,	4,	5,	6,	7,	8,	9,	10,	1,	2,	3,	4],
    2 => [5,	6,	7,	8,	9,	10,	1,	2,	3,	4,	5,	6],
    3 => [7,	8,	9,	10,	1,	2,	3,	4,	5,	6,	7,	8],
    4 => [9,	10,	1,	2,	3,	4,	5,	6,	7,	8,	9,	10]
  }
end
