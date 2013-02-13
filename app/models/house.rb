class House < ActiveRecord::Base
  def self.reseed
    destroy_all
    NAMES.each_with_index do |name, index|
      house = House.create! name: name, ordinal: (index+1)
      
      stuff = %(
        def self._#{house.ordinal}
          @_#{house.ordinal} ||= find('#{house.id}')
        end
      ).split("\n").map(&:strip).reject{|t| t.empty?}.join(";") + ";"
      
      class_eval stuff
      
      File.open('house.rb', 'a'){|file|
        file.write stuff
      }
    end
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

  def self._1;@_1 ||= find('1');end;def self._2;@_2 ||= find('2');end;def self._3;@_3 ||= find('3');end;def self._4;@_4 ||= find('4');end;def self._5;@_5 ||= find('5');end;def self._6;@_6 ||= find('6');end;def self._7;@_7 ||= find('7');end;def self._8;@_8 ||= find('8');end;def self._9;@_9 ||= find('9');end;def self._10;@_10 ||= find('10');end;def self._11;@_11 ||= find('11');end;def self._12;@_12 ||= find('12');end;
end
