# encoding: utf-8
class Jieqi < ActiveRecord::Base
  extend FriendlyId
  friendly_id :english, use: :finders
  
  default_scope ->{order(:ordinal)}
  
  
  
  def self.reseed
    Jieqi.destroy_all
    [[1,"立春 (Lìchūn)","Beginning of Spring","315","02/04/12 06:21 PM"],
    [2,"雨水 (Yǔshuǐ)","Rain Water","330","02/19/12 02:16 PM"],
    [3,"惊蛰 (Jīngzhí)","Waking of Insects","345","03/05/12 12:20 PM"],
    [4,"春分 (Chūnfēn)","Spring Equinox","0","03/20/12 01:13 PM"],
    [5,"清明 (Qīngmíng)","Pure Brightness","15","04/04/12 05:05 PM"],
    [6,"谷雨 (Gǔyǔ)","Grain Rain","30","04/20/12 12:11 AM"],
    [7,"立夏 (Lìxià)","Beginning of Summer","45","05/05/12 10:19 AM"],
    [8,"小满 (Xiǎomǎn)","Grain Full","60","05/20/12 11:14 PM"],
    [9,"芒种 (Mángzhòng)","Grain in Ear","75","06/05/12 02:25 PM"],
    [10,"夏至 (Xiàzhì)","Summer Solstice","90","06/21/12 07:08 AM"],
    [11,"小暑 (Xiǎoshǔ)","Slight Heat","105","07/07/12 12:40 AM"],
    [12,"大暑 (Dàshǔ)","Great Heat","120","07/22/12 06:00 PM"],
    [13,"立秋 (Lìqiū)","Beginning of Autumn","135","08/07/12 10:30 AM"],
    [14,"处暑 (Chǔshǔ)","Limit of Heat","150","08/23/12 01:06 AM"],
    [15,"白露 (Báilù)","White Dew","165","09/07/12 01:28 PM"],
    [16,"秋分 (Qiūfēn)","Autumnal Equinox","180","09/22/12 10:48 PM"],
    [17,"寒露 (Hánlù)","Cold Dew","195","10/08/12 05:11 AM"],
    [18,"霜降 (Shuāngjiàng)","Descent of Frost","210","10/23/12 08:13 AM"],
    [19,"立冬 (Lìdōng)","Beginning of Winter","225","11/07/12 08:25 AM"],
    [20,"小雪 (Xiǎoxuě)","Slight Snow","240","11/22/12 05:49 AM"],
    [21,"大雪 (Dàxuě)","Great Snow","255","12/07/12 01:18 AM"],
    [22,"冬至 (Dōngzhì)","Winter Solstice","270","12/21/12 07:11 PM"],
    [23,"小寒 (Xiǎohán)","Slight Cold","285","01/05/13 12:33 PM"],
    [24,"大寒 (Dàhán)","Great Cold","300","01/20/13 05:51 AM"]].each do |data|
      ch_parts = data[1].match(/(..)\s+\((.*)\)/)
      Jieqi.create! ordinal: data[0], chinese: ch_parts[1], pinyin: ch_parts[2], english: data[2], solar_longitude: data[3].to_i
    end
  end
end
