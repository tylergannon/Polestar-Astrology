class Star < ActiveRecord::Base
  include Extensions::BsFriendlyId
  friendly_id :pinyin
  
  has_many :star_palaces
  has_many :comments, as: :commentable
  
  def my_comments(member)
    @my_comments ||= comments.where(member_id: member.id)
  end
  
  def star_palace(palace)
    star_palaces.where(palace_id: palace.id).first
  end
  
  def full_name
    pinyin + ' / ' + english
  end
  
  def symbol_name
    pinyin.underscore.gsub(/[\s\-]/, '_')
  end
  
  def self.all_stars
    @all_stars ||= STARS.to_a.map{|t|
      Star.send t[1][0].underscore.gsub(/[\s\-]/, '_')
    }
  end
  
  def self.reseed
    Star.destroy_all
    STARS.each do |wade_giles, info|
      star = Star.create! pinyin: info[0], english: info[1], description: info[2], rank: info[3]
      
      # stuff = %(
      #   def self.#{star.symbol_name}
      #     @#{star.symbol_name} ||= find('#{star.friendly_id}')
      #   end
      # ).split("\n").map(&:strip).reject{|t| t.empty?}.join(";") + ";"
      # 
      # class_eval stuff
      # 
      # File.open('star.rb', 'a'){|file|
      #   file.write stuff
      # }
    end
  end

  STARS = {
    tzu_wei: ['Zi Wei', 'Emperor', 'The Center, ruler of all, Yang Power', 1],
    tien_fu: ['Tian Fu', 'Empress', 'Primary access to everything, Yin power', 1],
    tien_hsiang: ['Tian Xiang', 'Tutor', 'Power behind throne, access to knowledge', 1],
    tien_chi: ['Tian Ji', 'Oracle', 'Intuition, unusual knowledge', 1],

    tai_yang: ['Tai Yang', 'Sun', 'Prince, possibility to take it all', 2],
    wu_chu: ['Wu Qu', 'General', "The 'old man' and advisor in tactics", 2],
    tai_yin: ['Tai Yin', 'Moon', 'Princess, the link to other realms', 2],
    chu_men: ['Ju Men', 'Great Gate', 'Availability of anything', 2],

    tien_tung: ['Tian Tong', 'Vassal', 'Power from supporting the leader', 3],
    tien_liang: ['Tian Liang', 'Roof Beam', "'Feng Shui', feelings of place", 3],
    wen_chang: ['Wen Chang', 'Magistrate', 'The judge, rule of law', 3],
    wen_chu: ['Wen Qu', 'Priest', 'Access to the divine, rituals', 3],

    lien_chen: ['Lian Zhen', 'Concubine', 'Chastity, close to power if beautiful', 4],
    tan_lang: ['Tan Lang', 'Greedy Wolf', 'Devourer, takes all', 4],
    chi_sha: ['Qi Sha', '7 Killings', 'Death, ruin, bad luck', 4],
    po_chun: ['Po Jun', 'Rebel', 'The one who causes trouble', 4],

    fire_star: ['Huo Xing', 'Fire Star', '', 5],
    ringing_star: ['Ling Xing', 'Water Star', '', 5],
    yang_jen: ['Yang Ren', 'Goat Blade', 'Injuries, but also competition', 5],
    to_lo: ['Tuo Luo', 'Hump Back', '', 5],

    yu_pi: ['You Bi', 'Right Assistant', '', 6],
    tso_fu: ['Zuo Fu', 'Left Assistant', '', 6],
    tien_tsun: ['Tian Cun', 'Storehouse', '', 6],
    tian_yao: ['Tian Yao', 'Beauty', '', 6],

    tien_kuei: ['Tian Kui', 'Leader', '', 7],
    tien_hsi: ['Tian Xi', 'Happiness', '', 7],
    tien_kung: ['Di Gong', 'Void', '', 7],
    tien_yueh: ['Tian Yue', 'Halberd', '', 7],
    tian_hsing: ['Tian Xing', 'Punishment', '', 7],
    ti_chieh: ['Di Jie', 'Loss', '', 7]
  }
  def self.zi_wei;@zi_wei ||= find('zi-wei');end;def self.tian_fu;@tian_fu ||= find('tian-fu');end;def self.tian_xiang;@tian_xiang ||= find('tian-xiang');end;def self.tian_ji;@tian_ji ||= find('tian-ji');end;def self.tai_yang;@tai_yang ||= find('tai-yang');end;def self.wu_qu;@wu_qu ||= find('wu-qu');end;def self.tai_yin;@tai_yin ||= find('tai-yin');end;def self.ju_men;@ju_men ||= find('ju-men');end;def self.tian_tong;@tian_tong ||= find('tian-tong');end;def self.tian_liang;@tian_liang ||= find('tian-liang');end;def self.wen_chang;@wen_chang ||= find('wen-chang');end;def self.wen_qu;@wen_qu ||= find('wen-qu');end;def self.lian_zhen;@lian_zhen ||= find('lian-zhen');end;def self.tan_lang;@tan_lang ||= find('tan-lang');end;def self.qi_sha;@qi_sha ||= find('qi-sha');end;def self.po_jun;@po_jun ||= find('po-jun');end;def self.huo_xing;@huo_xing ||= find('huo-xing');end;def self.ling_xing;@ling_xing ||= find('ling-xing');end;def self.yang_ren;@yang_ren ||= find('yang-ren');end;def self.tuo_luo;@tuo_luo ||= find('tuo-luo');end;def self.you_bi;@you_bi ||= find('you-bi');end;def self.zuo_fu;@zuo_fu ||= find('zuo-fu');end;def self.tian_cun;@tian_cun ||= find('tian-cun');end;def self.tian_yao;@tian_yao ||= find('tian-yao');end;def self.tian_kui;@tian_kui ||= find('tian-kui');end;def self.tian_xi;@tian_xi ||= find('tian-xi');end;def self.di_gong;@di_gong ||= find('di-gong');end;def self.tian_yue;@tian_yue ||= find('tian-yue');end;def self.tian_xing;@tian_xing ||= find('tian-xing');end;def self.di_jie;@di_jie ||= find('di-jie');end;
end
