class Element < ActiveRecord::Base
  include Extensions::BsFriendlyId
  friendly_id :name
  
  def self.by_name(el)
    send el
  end
  
  def related_to(element)
    relationship = (element.ordinal - self.ordinal) % 5
    puts "relationship: #{relationship}"
    case relationship
    when 1
      "#{name.titleize} is the mother of #{element.name.titleize}"
    when 4
      "#{name.titleize} is generated (nourished) by #{element.name.titleize}"
    when 2
      "#{name.titleize} controls (subdues) #{element.name.titleize}"
    when 3
      "#{name.titleize} is controlled (subdued) by #{element.name.titleize}"
    when 0
      "#{name.titleize} is the same as #{element.name.titleize}"
    end
  end
  
  def self.reseed
    Element.destroy_all
    ['wood', 'fire', 'earth', 'metal', 'water'].each_with_index do |el, i|
      element = Element.create! name: el, ordinal: (i+1)
      # stuff=  "
      #   def self.#{element.name}
      #     @#{element.name} ||= find('#{element.name}')
      #   end
      #   ".split("\n").map(&:strip).reject{|t| t.empty?}.join(";") + ";"
      # class_eval stuff
      # File.open('_element.rb', 'a'){|file|
      #   file.write stuff
      # } 
    end
  end
  def self.wood;@wood ||= find('wood');end;def self.fire;@fire ||= find('fire');end;def self.earth;@earth ||= find('earth');end;def self.metal;@metal ||= find('metal');end;def self.water;@water ||= find('water');end;
end
