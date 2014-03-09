class Pillar < ActiveRecord::Base
  extend FriendlyId
  friendly_id :name, use: [:finders, :slugged]
  
  belongs_to :stem
  belongs_to :branch
  
  def self.by_stem_and_branch(stem, branch)
    if stem.kind_of?(Stem)
      stem = stem.id
      branch = branch.id
    end
    Pillar.where(stem_id: stem, branch_id: branch).first
  end

  def name
    "#{stem.element} #{branch.animal}".titleize
  end
  
  def self.[](i)
    send "_#{i}"
  end
  
  def self.find_by_stem_and_branch(stem, branch)
    where(:stem_id => stem.id, :branch_id => branch.id).first
  end
  
  def native_element
    Element.send(branch.native_stem.element)
  end
  
  def next
    Pillar.send "_#{(ordinal % 60)+1}"
  end
  
  def self.from_name(name)
    Pillar.send name.gsub(/[\s\-]/, '_').underscore
  end
  
  def chinese
    "#{stem.char}#{branch.char}"
  end
  
  def pinyin
    "#{stem.pinyin} #{branch.pinyin}"
  end
    
  def cocoa_id
    [stem.id-1, branch.id-1]
  end
  
  def as_json
    {
      id: cocoa_id,
      name: name,
      chinese: chinese,
      pinyin: pinyin,
      native_element: native_element.name,      
      stem: {
        pinyin: stem.pinyin,
        element: stem.element
      },
      branch: {
        pinyin: branch.pinyin,
        animal: branch.animal
      }
    }
  end
  
  def self.reseed
    Pillar.destroy_all
    stem_id = 1
    branch_id = 1
    (1..60).each do |i|
      pillar = Pillar.create! stem: Stem[stem_id], branch: Branch[branch_id], ordinal: i
      # stuff = "
      # def self.#{pillar.friendly_id.gsub(/\-/, '_')}
      #   @#{pillar.friendly_id.gsub(/\-/, '_')} ||= Pillar.find('#{pillar.friendly_id}')
      # end
      # 
      # def self.#{pillar.stem.normalized}_#{pillar.branch.normalized}
      #   #{pillar.friendly_id.gsub(/\-/, '_')}
      # end
      # 
      # def self._#{i}
      #   #{pillar.friendly_id.gsub(/\-/, '_')}
      # end
      # 
      # ".split("\n").map(&:strip).reject{|t| t.empty?}.join(";") + ";"
      # 
      # class_eval stuff
      # 
      # File.open('pillar.rb', 'a'){|file|
      #   file.write stuff
      # }
      stem_id = (stem_id % 10) + 1
      branch_id = (branch_id % 12) + 1
    end
  end
  def self.wood_rat;@wood_rat ||= Pillar.find('wood-rat');end;def self.jia_zi;wood_rat;end;def self._1;wood_rat;end;def self.wood_ox;@wood_ox ||= Pillar.find('wood-ox');end;def self.yi_chou;wood_ox;end;def self._2;wood_ox;end;def self.fire_tiger;@fire_tiger ||= Pillar.find('fire-tiger');end;def self.bing_yin;fire_tiger;end;def self._3;fire_tiger;end;def self.fire_rabbit;@fire_rabbit ||= Pillar.find('fire-rabbit');end;def self.ding_mao;fire_rabbit;end;def self._4;fire_rabbit;end;def self.earth_dragon;@earth_dragon ||= Pillar.find('earth-dragon');end;def self.wu_chen;earth_dragon;end;def self._5;earth_dragon;end;def self.earth_snake;@earth_snake ||= Pillar.find('earth-snake');end;def self.ji_si;earth_snake;end;def self._6;earth_snake;end;def self.metal_horse;@metal_horse ||= Pillar.find('metal-horse');end;def self.geng_wu;metal_horse;end;def self._7;metal_horse;end;def self.metal_goat;@metal_goat ||= Pillar.find('metal-goat');end;def self.xin_wei;metal_goat;end;def self._8;metal_goat;end;def self.water_monkey;@water_monkey ||= Pillar.find('water-monkey');end;def self.ren_shen;water_monkey;end;def self._9;water_monkey;end;def self.water_rooster;@water_rooster ||= Pillar.find('water-rooster');end;def self.gui_you;water_rooster;end;def self._10;water_rooster;end;def self.wood_dog;@wood_dog ||= Pillar.find('wood-dog');end;def self.jia_xu;wood_dog;end;def self._11;wood_dog;end;def self.wood_pig;@wood_pig ||= Pillar.find('wood-pig');end;def self.yi_hai;wood_pig;end;def self._12;wood_pig;end;def self.fire_rat;@fire_rat ||= Pillar.find('fire-rat');end;def self.bing_zi;fire_rat;end;def self._13;fire_rat;end;def self.fire_ox;@fire_ox ||= Pillar.find('fire-ox');end;def self.ding_chou;fire_ox;end;def self._14;fire_ox;end;def self.earth_tiger;@earth_tiger ||= Pillar.find('earth-tiger');end;def self.wu_yin;earth_tiger;end;def self._15;earth_tiger;end;def self.earth_rabbit;@earth_rabbit ||= Pillar.find('earth-rabbit');end;def self.ji_mao;earth_rabbit;end;def self._16;earth_rabbit;end;def self.metal_dragon;@metal_dragon ||= Pillar.find('metal-dragon');end;def self.geng_chen;metal_dragon;end;def self._17;metal_dragon;end;def self.metal_snake;@metal_snake ||= Pillar.find('metal-snake');end;def self.xin_si;metal_snake;end;def self._18;metal_snake;end;def self.water_horse;@water_horse ||= Pillar.find('water-horse');end;def self.ren_wu;water_horse;end;def self._19;water_horse;end;def self.water_goat;@water_goat ||= Pillar.find('water-goat');end;def self.gui_wei;water_goat;end;def self._20;water_goat;end;def self.wood_monkey;@wood_monkey ||= Pillar.find('wood-monkey');end;def self.jia_shen;wood_monkey;end;def self._21;wood_monkey;end;def self.wood_rooster;@wood_rooster ||= Pillar.find('wood-rooster');end;def self.yi_you;wood_rooster;end;def self._22;wood_rooster;end;def self.fire_dog;@fire_dog ||= Pillar.find('fire-dog');end;def self.bing_xu;fire_dog;end;def self._23;fire_dog;end;def self.fire_pig;@fire_pig ||= Pillar.find('fire-pig');end;def self.ding_hai;fire_pig;end;def self._24;fire_pig;end;def self.earth_rat;@earth_rat ||= Pillar.find('earth-rat');end;def self.wu_zi;earth_rat;end;def self._25;earth_rat;end;def self.earth_ox;@earth_ox ||= Pillar.find('earth-ox');end;def self.ji_chou;earth_ox;end;def self._26;earth_ox;end;def self.metal_tiger;@metal_tiger ||= Pillar.find('metal-tiger');end;def self.geng_yin;metal_tiger;end;def self._27;metal_tiger;end;def self.metal_rabbit;@metal_rabbit ||= Pillar.find('metal-rabbit');end;def self.xin_mao;metal_rabbit;end;def self._28;metal_rabbit;end;def self.water_dragon;@water_dragon ||= Pillar.find('water-dragon');end;def self.ren_chen;water_dragon;end;def self._29;water_dragon;end;def self.water_snake;@water_snake ||= Pillar.find('water-snake');end;def self.gui_si;water_snake;end;def self._30;water_snake;end;def self.wood_horse;@wood_horse ||= Pillar.find('wood-horse');end;def self.jia_wu;wood_horse;end;def self._31;wood_horse;end;def self.wood_goat;@wood_goat ||= Pillar.find('wood-goat');end;def self.yi_wei;wood_goat;end;def self._32;wood_goat;end;def self.fire_monkey;@fire_monkey ||= Pillar.find('fire-monkey');end;def self.bing_shen;fire_monkey;end;def self._33;fire_monkey;end;def self.fire_rooster;@fire_rooster ||= Pillar.find('fire-rooster');end;def self.ding_you;fire_rooster;end;def self._34;fire_rooster;end;def self.earth_dog;@earth_dog ||= Pillar.find('earth-dog');end;def self.wu_xu;earth_dog;end;def self._35;earth_dog;end;def self.earth_pig;@earth_pig ||= Pillar.find('earth-pig');end;def self.ji_hai;earth_pig;end;def self._36;earth_pig;end;def self.metal_rat;@metal_rat ||= Pillar.find('metal-rat');end;def self.geng_zi;metal_rat;end;def self._37;metal_rat;end;def self.metal_ox;@metal_ox ||= Pillar.find('metal-ox');end;def self.xin_chou;metal_ox;end;def self._38;metal_ox;end;def self.water_tiger;@water_tiger ||= Pillar.find('water-tiger');end;def self.ren_yin;water_tiger;end;def self._39;water_tiger;end;def self.water_rabbit;@water_rabbit ||= Pillar.find('water-rabbit');end;def self.gui_mao;water_rabbit;end;def self._40;water_rabbit;end;def self.wood_dragon;@wood_dragon ||= Pillar.find('wood-dragon');end;def self.jia_chen;wood_dragon;end;def self._41;wood_dragon;end;def self.wood_snake;@wood_snake ||= Pillar.find('wood-snake');end;def self.yi_si;wood_snake;end;def self._42;wood_snake;end;def self.fire_horse;@fire_horse ||= Pillar.find('fire-horse');end;def self.bing_wu;fire_horse;end;def self._43;fire_horse;end;def self.fire_goat;@fire_goat ||= Pillar.find('fire-goat');end;def self.ding_wei;fire_goat;end;def self._44;fire_goat;end;def self.earth_monkey;@earth_monkey ||= Pillar.find('earth-monkey');end;def self.wu_shen;earth_monkey;end;def self._45;earth_monkey;end;def self.earth_rooster;@earth_rooster ||= Pillar.find('earth-rooster');end;def self.ji_you;earth_rooster;end;def self._46;earth_rooster;end;def self.metal_dog;@metal_dog ||= Pillar.find('metal-dog');end;def self.geng_xu;metal_dog;end;def self._47;metal_dog;end;def self.metal_pig;@metal_pig ||= Pillar.find('metal-pig');end;def self.xin_hai;metal_pig;end;def self._48;metal_pig;end;def self.water_rat;@water_rat ||= Pillar.find('water-rat');end;def self.ren_zi;water_rat;end;def self._49;water_rat;end;def self.water_ox;@water_ox ||= Pillar.find('water-ox');end;def self.gui_chou;water_ox;end;def self._50;water_ox;end;def self.wood_tiger;@wood_tiger ||= Pillar.find('wood-tiger');end;def self.jia_yin;wood_tiger;end;def self._51;wood_tiger;end;def self.wood_rabbit;@wood_rabbit ||= Pillar.find('wood-rabbit');end;def self.yi_mao;wood_rabbit;end;def self._52;wood_rabbit;end;def self.fire_dragon;@fire_dragon ||= Pillar.find('fire-dragon');end;def self.bing_chen;fire_dragon;end;def self._53;fire_dragon;end;def self.fire_snake;@fire_snake ||= Pillar.find('fire-snake');end;def self.ding_si;fire_snake;end;def self._54;fire_snake;end;def self.earth_horse;@earth_horse ||= Pillar.find('earth-horse');end;def self.wu_wu;earth_horse;end;def self._55;earth_horse;end;def self.earth_goat;@earth_goat ||= Pillar.find('earth-goat');end;def self.ji_wei;earth_goat;end;def self._56;earth_goat;end;def self.metal_monkey;@metal_monkey ||= Pillar.find('metal-monkey');end;def self.geng_shen;metal_monkey;end;def self._57;metal_monkey;end;def self.metal_rooster;@metal_rooster ||= Pillar.find('metal-rooster');end;def self.xin_you;metal_rooster;end;def self._58;metal_rooster;end;def self.water_dog;@water_dog ||= Pillar.find('water-dog');end;def self.ren_xu;water_dog;end;def self._59;water_dog;end;def self.water_pig;@water_pig ||= Pillar.find('water-pig');end;def self.gui_hai;water_pig;end;def self._60;water_pig;end;
end
