# Grabs the lunar date and four pillars given a solar date and time.
# This site returns info in HTML that looks like this: 
# 
# <TITLE>Chinese Calendar</TITLE>
# <H1>solar to lunar calendar conversion </H1>
# <PRE>
# Lunar Version 2.1 (July 23, 1992)
# 
# Solar : 1995.1.31.14  Tuesday
# Lunar : 1995.1.1.14 ShengXiao: Pig
# GanZhi: Yi3-Hai4.Wu4-Yin2.Ren2-Xu1.Ding1-Wei4
#         (GanZhi Order)  2-12.5-3.9-11.4-8
#         (JiaZi Cycle) 12.15.59.44
# 
# BaZi (8-characters) according to 'Four Column Calculation':
#         Jia3-Xu1.Ding1-Chou3.Ren2-Xu1.Ding1-Wei4
#         (GanZhi Order)  1-11.4-2.9-11.4-8
#         (JiaZi Cycle) 11.14.59.44
# 
# 
# -----
# By: Fung F. Lee and Ricky Yeung
# HTML interface by: <a href="http://www.cnd.org/HYPLAN/wlin/">WL</a></PRE>
class ChartRipper
  def self.rip(date)
    agent = Mechanize.new
    page = agent.get("http://www.cnd.org/cgi/lunar/s2l/English?#{date.year}+#{date.month}+#{date.day}+#{date.hour}")
    match = page.content.match(/([a-zA-Z]{2,10})\d\-([a-zA-Z]{2,10})\d\.([a-zA-Z]{2,10})\d\-([a-zA-Z]{2,10})\d\.([a-zA-Z]{2,10})\d\-([a-zA-Z]{2,10})\d\.([a-zA-Z]{2,10})\d\-([a-zA-Z]{2,10})\d/)
    date_match = page.content.match(/Lunar\s+\:\s+(\d{4})\.(\d{1,2}).(\d{1,2}).(\d{1,2})/)

    Chart.new solar_date: date, 
              year: Pillar.from_name("#{match[1]} #{match[2]}"), 
              month: Pillar.from_name("#{match[3]} #{match[4]}"), 
              day: Pillar.from_name("#{match[5]} #{match[6]}"),
              hour: Pillar.from_name("#{match[7]} #{match[8]}"),
              lunar_year: (date_match[1].to_i + 2698),
              lunar_month: date_match[2],
              day_of_month: date_match[3]
    
  end
end