# encoding: utf-8
class Branch < ActiveRecord::Base
  include Extensions::BsFriendlyId
  friendly_id :animal, cache: true
  belongs_to :native_stem, :class_name => 'Stem'
  has_many :pillars
  
  ANIMALS = ["rat", "ox", "tiger", "rabbit", "dragon", "snake", "horse", "goat", "monkey", "rooster", "dog", "pig"]
  
  def hour
    hour = (ordinal-1)*2
    start_time = Time.parse("#{hour}:00")
    unless start_time.dst?
      start_time -= 1.hour
    end
    start_time.hour
  end
  
  def time_of_day
    hour = (ordinal-1)*2
    start_time = Time.parse("#{hour}:00")
    unless start_time.dst?
      start_time -= 1.hour
    end
    end_time = start_time + 2.hours
    "#{start_time.strftime("%l%P")}-#{end_time.strftime("%l%P")}"
  end
  
  def self.[](i)
    send "_#{i}"
  end
  
  def related_to(other)
    relationship = (other.ordinal- ordinal) % 12
    case relationship
    when 4
      "#{animal.titleize} is trine with #{other.animal.titleize}"
    when 8
      "#{animal.titleize} is trine with #{other.animal.titleize}"
    when 6
      "#{animal.titleize} is diametric to #{other.animal.titleize}"
    when 0
      "#{animal.titleize} and #{other.animal.titleize}... same same"
    else
      "#{animal.titleize} and #{other.animal.titleize} are niether opposed nor trine."
    end
  end
  
  def next
    Branch.send "_#{(ordinal % 12)+1}"
  end

  def previous
    Branch.send "_#{ordinal == 1 ? 12 : (ordinal-1)}"
  end
  
  def diametric
    Branch.send "_#{(ordinal+6)%12}"
  end
  
  def self.by_name(name)
    send name
  end

  def self.reseed
    Branch.destroy_all
    
    [
      %w(子 zǐ zi rat 1 11 yang-water 1),
      %w(丑 chǒu chou ox 2 12 yin-earth 2),
      %w(寅 yín yin tiger 3 1 yang-wood 3),
      %w(卯 mǎo mao rabbit 4 2 yin-wood 4),
      %w(辰 chén chen dragon 5 3 yang-earth 5),
      %w(巳 sì si snake 6 4 yin-fire 6),
      %w(午 wǔ wu horse 7 5 yang-fire 7),
      %w(未 wèi wei goat 8 6 yin-earth 8),
      %w(申 shēn shen monkey 9 7 yang-metal 9),
      %w(酉 yǒu you rooster 10 8 yin-metal 10),
      %w(戌 xū xu dog 11 9 yang-earth 11),
      %w(亥 hài hai pig 12 10 yin-water 12),
    ].each_with_index do |data, i|
      branch=create! char: data[0], pinyin: data[1], normalized: data[2], animal: data[3], hour: data[4], 
        month: data[5], native_stem: Stem.find(data[6]), ordinal: data[7].to_i
    end
  end
  
def self.rat;@rat ||= find('rat');end;def self.zi;rat;end;def self._1;zi;end;def self.ox;@ox ||= find('ox');end;def self.chou;ox;end;def self._2;chou;end;def self.tiger;@tiger ||= find('tiger');end;def self.yin;tiger;end;def self._3;yin;end;def self.rabbit;@rabbit ||= find('rabbit');end;def self.mao;rabbit;end;def self._4;mao;end;def self.dragon;@dragon ||= find('dragon');end;def self.chen;dragon;end;def self._5;chen;end;def self.snake;@snake ||= find('snake');end;def self.si;snake;end;def self._6;si;end;def self.horse;@horse ||= find('horse');end;def self.wu;horse;end;def self._7;wu;end;def self.goat;@goat ||= find('goat');end;def self.wei;goat;end;def self._8;wei;end;def self.monkey;@monkey ||= find('monkey');end;def self.shen;monkey;end;def self._9;shen;end;def self.rooster;@rooster ||= find('rooster');end;def self.you;rooster;end;def self._10;you;end;def self.dog;@dog ||= find('dog');end;def self.xu;dog;end;def self._11;xu;end;def self.pig;@pig ||= find('pig');end;def self.hai;pig;end;def self._12;hai;end;def self._0;_12;end;
end
