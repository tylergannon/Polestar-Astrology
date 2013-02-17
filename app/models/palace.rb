class Palace < ActiveRecord::Base  
  include Extensions::BsFriendlyId
  friendly_id :fix_name, cache: true
  
  has_many :star_relationships do
    def by_member(member)
      where(member_id: member.id)
    end
  end
  
  def fix_name
    name.underscore.gsub(/\//, '-')
  end
  
  def self.reseed
    destroy_all
    NAMES.each_with_index do |name, index|
      palace = Palace.create! name: name, ordinal: (index+1)

      # stuff = %(
      #   def self._#{palace.ordinal}
      #     @_#{palace.ordinal} ||= where(ordinal: #{palace.ordinal}).first
      #   end
      # ).split("\n").map(&:strip).reject{|t| t.empty?}.join(";") + ";"
      # 
      # class_eval stuff
      # 
      # File.open('palace.rb', 'a'){|file|
      #   file.write stuff
      # }

    end
  end
  
  def self.[](index)
    send("_#{index}")
  end
  
  NAMES = %w(
    Ming
    Youth/Siblings
    Partner/Spouse
    Children
    Wealth
    Health
    Career/Travel
    Assistants
    Superiors
    Property
    Pleasure
    Ancestors
  )

  def self._1;@_1 ||= where(ordinal: 1).first;end;def self._2;@_2 ||= where(ordinal: 2).first;end;def self._3;@_3 ||= where(ordinal: 3).first;end;def self._4;@_4 ||= where(ordinal: 4).first;end;def self._5;@_5 ||= where(ordinal: 5).first;end;def self._6;@_6 ||= where(ordinal: 6).first;end;def self._7;@_7 ||= where(ordinal: 7).first;end;def self._8;@_8 ||= where(ordinal: 8).first;end;def self._9;@_9 ||= where(ordinal: 9).first;end;def self._10;@_10 ||= where(ordinal: 10).first;end;def self._11;@_11 ||= where(ordinal: 11).first;end;def self._12;@_12 ||= where(ordinal: 12).first;end;
end
