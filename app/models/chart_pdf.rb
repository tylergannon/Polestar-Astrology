class ChartPdf < Prawn::Document
  attr_accessor :chart, :view_context, :name
  def initialize(chart, name, view_context)
    self.chart = chart
    self.name = name
    self.view_context = view_context
    super(:page_layout => :landscape)
    draw_palace(find_palace('snake'), [0, HEIGHT])
    draw_palace(find_palace('horse'), [WIDTH/4, HEIGHT])
    draw_palace(find_palace('goat'), [WIDTH/2, HEIGHT])
    draw_palace(find_palace('monkey'), [3*WIDTH/4, HEIGHT])

    draw_palace(find_palace('rooster'), [3*WIDTH/4, 3* HEIGHT/4])
    draw_palace(find_palace('dog'), [3*WIDTH/4, HEIGHT/2])
    draw_palace(find_palace('pig'), [3*WIDTH/4, HEIGHT/4])
    draw_palace(find_palace('rat'), [WIDTH/2, HEIGHT/4])
    draw_palace(find_palace('ox'), [WIDTH/4, HEIGHT/4])
    draw_palace(find_palace('tiger'), [0, HEIGHT/4])
    draw_palace(find_palace('rabbit'), [0, HEIGHT/2])
    draw_palace(find_palace('dragon'), [0, 3*HEIGHT/4])
    draw_center
    draw_text "Copyright 2012 Da Yuan Circle", at: [5,5], size: 6, style: :italic
  end
  
  HEIGHT = (7.5 * 72.0)
  WIDTH = 10 * 72.0
  
  private
  
  def draw_center
    bounding_box [palace_width, palace_height * 3], :width => palace_width*2, :height => palace_height*2 do
      stroke_bounds
      move_down 45
      text name, align: :center, size: 16, style: :bold
      move_down 10
      attribs = {align: :center, size: 10, style: :bold, inline_format: true, font: 'Comic-Sans'}

      text "Solar: #{chart.solar_date.strftime('%Y %b %-d / %H:%M')}", attribs
      text "Lunar: #{nth(chart.lunar_month)} month / #{nth(chart.day_of_month)} day", attribs
      text "Inner Element: <i>#{chart.inner_element.camelize}</i>", attribs
      move_down 20
      # attribs.merge! size: 11
      move_down 6
      text "Year: #{chart.year.name}", attribs.merge(size: 13)
      text "Month: #{chart.month.name}", attribs.merge(size: 8)
      text "Day: #{chart.day.name}", attribs.merge(size: 8)
      text "Hour: #{chart.hour.name}", attribs.merge(size: 13)
      
      move_down 18
      
      w = palace_width*2/5
      indent= 13
      
      draw_text "Wood: #{chart.wood_score}", attribs.merge(at: [indent+w*0, 15], size:  12).except(:align)
      draw_text "Fire: #{chart.fire_score}", attribs.merge(at: [indent+w*1, 15], size:  12).except(:align)
      draw_text "Earth: #{chart.earth_score}", attribs.merge(at: [indent+w*2, 15], size:  12).except(:align)
      draw_text "Metal: #{chart.metal_score}", attribs.merge(at: [indent+w*3, 15], size:  12).except(:align)
      draw_text "Water: #{chart.water_score}", attribs.merge(at: [indent+w*4, 15], size:  12).except(:align)
      
      # formatted_text_box [{:text => name, :styles => [:bold], :size => 18}]
      # draw_text name, :at => [0, 150], :justify => :center
    end
  end
  
  def nth(num)
    if num==1
      "#{num}<sup>st</sup>"
    elsif num==2
      "#{num}<sup>nd</sup>"
    elsif num==3
      "#{num}<sup>rd</sup>"
    else
      "#{num}<sup>th</sup>"
    end
  end
  
  
  def draw_palace(palace, location)
    attribs = {size: 10, style: :bold, inline_format: true, font: 'Times-Roman'}
    bounding_box location, :width => palace_width, :height => palace_height do
      stroke_bounds
      draw_text "#{palace.ordinal}. #{palace.name}", attribs.merge(at: [10, palace_height - 20], size:  12)
      draw_text palace.location.animal, attribs.merge(at: [110, 6])
      
      major_star_attributes = {size: 11}
      if palace.major_stars.empty?
        other_palace = palaces.by_location(palace.location.diametric)
        major_stars = other_palace.major_stars.sort_by_rank.map{|t| "(#{t.full_name})"}
        major_star_attributes[:style] = :italic
      else
        major_stars = palace.major_stars.sort_by_rank.map{|t| "#{t.full_name}"}
      end

      major_stars.each_with_index do |t, index|
        draw_text t, attribs.merge(major_star_attributes.merge(at: [20, palace_height - 45 - index * 15]))
      end

      palace.minor_stars.sort_by_rank.each_with_index do |star, index|
        location = [25, palace_height - (55 + major_stars.size*15) - index * 10]
        draw_text "#{star.full_name}", attribs.merge(size: 7, at: location, style: :italic)
      end
    end
  end
  
  def palace_number(palace)
    palaces.by_palace_ordinal(palace)
  end
  
  def find_palace(name)
    palaces.by_location(Branch.send(name))
  end
  
  def palaces
    @palaces ||= ChartPalaceList.build(chart)
  end
  
  def palace_height
    HEIGHT / 4.0
  end
  def palace_width
    WIDTH / 4.0
  end
end