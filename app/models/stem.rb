# encoding: utf-8

class Stem < ActiveRecord::Base
  include Extensions::BsFriendlyId
  friendly_id :name

  validates :yin_yang, :presence => true
  validates :element, :presence => true
  validate :yin_yang_should_be_correct, :elements_should_be_correct
  
  has_many :pillars
  
  def _element
    @el ||= Element.by_name(element)
  end
  
  def yin_yang_should_be_correct
    unless %w(yin yang).include? yin_yang
      # raise "blah"
      errors.add :yin_yang, "yin_yang should be yin or yang"
    end
  end

  def elements_should_be_correct
    unless %w(wood fire earth metal water).include? element
      # raise "blah"
      errors.add :element, "element should be in #{%w(wood fire earth metal water).inspect}"
    end
  end
  
  def self.named(str)
    send str
  end
  
  def name
    "#{yin_yang} #{element}".titleize
  end

  def self.[](i)
    send "_#{i}"
  end

  def next
    Stem.send "_#{(ordinal % 10)+1}"
  end
    
  def Stem.reseed
    Stem.destroy_all
    [%w(甲 jiǎ kinoe kō 갑  gap  giáp 陽  yang  木  wood  東 East jia 1),
    %w(乙 yǐ kinoto otsu 을  eul  ất 陰  yin   木  wood  東 East yi 2),
    %w(丙 bǐng hinoe hei 병  byeong  bính 陽 yang  火  fire  南 South bing 3),
    %w(丁 dīng hinoto tei 정  jeong  đinh 陰 yin 火  fire  南 South ding 4),
    %w(戊 wù tsuchinoe bo 무  mu  mậu 陽 yang 土  earth  中 Middle wu 5),
    %w(己 jǐ tsuchinoto ki 기  gi  kỷ 陰 yin 土  earth  中 Middle ji 6),
    %w(庚 gēng kanoe kō 경  gyeong  canh 陽 yang 金  metal  西 West geng 7),
    %w(辛 xīn kanoto shin 신  sin  tân 陰 yin 金  metal  西 West xin 8),
    %w(壬 rén mizunoe jin 임  im  nhâm 陽 yang 水  water  北 North ren 9),
    %w(癸 guǐ mizunoto ki 계  gye quý 陰 yin 水  water  北 North gui 10)].each_with_index do |arr, i|
      stem = Stem.create :char => arr[0], :pinyin => arr[1], :yin_yang => arr[8], :element => arr[10], 
        :normalized => arr[13], :ordinal => arr[14].to_i
        
        # stuff = %(
        #     def self.#{stem.normalized};
        #       @#{stem.normalized} ||= find('#{stem.friendly_id}')
        #     end
        # 
        #     def self.#{stem.friendly_id.gsub(/\-/, '_')}
        #       #{stem.normalized}
        #     end
        # 
        #     def self._#{i+1}
        #       #{stem.normalized}
        #     end
        #     
        #     ).split("\n").map(&:strip).reject{|t| t.empty?}.join(";") + ";"
        # 
        # class_eval stuff
        # 
        # File.open('stem.rb', 'a'){|file|
        #   file.write stuff
        # }
    end
    
  end
  def self.jia;;@jia ||= find('yang-wood');end;def self.yang_wood;jia;end;def self._1;jia;end;def self.yi;;@yi ||= find('yin-wood');end;def self.yin_wood;yi;end;def self._2;yi;end;def self.bing;;@bing ||= find('yang-fire');end;def self.yang_fire;bing;end;def self._3;bing;end;def self.ding;;@ding ||= find('yin-fire');end;def self.yin_fire;ding;end;def self._4;ding;end;def self.wu;;@wu ||= find('yang-earth');end;def self.yang_earth;wu;end;def self._5;wu;end;def self.ji;;@ji ||= find('yin-earth');end;def self.yin_earth;ji;end;def self._6;ji;end;def self.geng;;@geng ||= find('yang-metal');end;def self.yang_metal;geng;end;def self._7;geng;end;def self.xin;;@xin ||= find('yin-metal');end;def self.yin_metal;xin;end;def self._8;xin;end;def self.ren;;@ren ||= find('yang-water');end;def self.yang_water;ren;end;def self._9;ren;end;def self.kui;;@kui ||= find('yin-water');end;def self.yin_water;kui;end;def self._10;kui;end;
end
