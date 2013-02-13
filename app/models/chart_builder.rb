class ChartBuilder
  attr_accessor :chart
  def initialize(chart); self.chart=chart;end
  
  delegate :year, :month, :day, :hour, :day_of_month, :to => :chart
  
  def attributes
    {
      ming: ming,
      inner_element: inner_element,
      zi_wei: zi_wei,
      tian_fu: tian_fu,
      tian_xiang: tian_xiang,
      tian_ji: tian_ji,
      tai_yang: tai_yang,
      wu_qu: wu_qu,
      tai_yin: tai_yin,
      ju_men: ju_men,
      tian_tong: tian_tong,
      tian_liang: tian_liang,
      wen_chang: wen_chang,
      wen_qu: wen_qu,
      lian_zhen: lian_zhen,
      tan_lang: tan_lang,
      qi_sha: qi_sha,
      po_jun: po_jun,
      huo_xing: huo_xing,
      ling_xing: ling_xing,
      yang_ren: yang_ren,
      tuo_luo: tuo_luo,
      you_bi: you_bi,
      zuo_fu: zuo_fu,
      tian_cun: tian_cun,
      tian_yao: tian_yao,
      tian_kui: tian_kui,
      tian_xi: tian_xi,
      di_gong: di_gong,
      tian_yue: tian_yue,
      tian_xing: tian_xing,
      di_jie: di_jie,
      wood_score: elemental_score['wood'],
      fire_score: elemental_score['fire'],
      earth_score: elemental_score['earth'],
      metal_score: elemental_score['metal'],
      water_score: elemental_score['water']
    }
  end

  def ming
    Branch[ (12 + month.branch.ordinal - hour.branch.ordinal) % 12 + 1 ]
  end
  
  def inner_element
    [%w(water fire earth wood metal water fire earth wood metal),
     %w(fire earth wood metal water fire earth wood metal water),
     %w(wood metal water fire earth wood metal water fire earth),
     %w(earth wood metal water fire earth wood metal water fire),
     %w(metal water fire earth wood metal water fire earth wood),
     %w(fire earth wood metal water fire earth wood metal water)][(ming.ordinal-1)/2][year.stem.ordinal-1]
  end
  
  def elemental_score
    @elemental_score ||= lambda {
      score = {'wood' => 0, 'fire' => 0, 'earth' => 0, 'metal' => 0, 'water' => 0}
      %w(year month day hour).map{|t| chart.send t}.each do |pillar|
        score[pillar.stem.element] += 1
        score[pillar.branch.native_stem.element] += 1
        score[SCORES[(pillar.ordinal.to_f/2).round-1]] += 1
      end
      score
    }.call
  end
  
  SCORES = %w(
  metal fire wood earth metal fire water earth metal wood 
  water earth fire wood water metal fire wood earth metal
  fire water earth metal wood water earth fire wood water
  )
  
  def zi_wei
    element_index = %w(wood fire earth metal water).index(inner_element)
        
    Branch.send [%w(chen you wu hai chou),
    %w(chou wu hai chen yin),
    %w(yin hai chen chou yin),
    %w(si chen chou yin mao),
    %w(yin chou yin zi mao),
    %w(mao yin wei si chen),
    %w(wu xu zi yin chen),
    %w(mao wei si mao si),
    %w(chen zi yin chou si),
    %w(wei si mao wu wu),
    %w(chen yin shen mao wu),
    %w(si mao chou chen wei),
    %w(shen hai wu yin wei),
    %w(si shen mao wei shen),
    %w(wu chou chen chen shen),
    %w(you wu you si you),
    %w(wu mao yin mao you),
    %w(wei chen wei shen xu),
    %w(xu zi chen si xu),
    %w(wei you si wu hai),
    %w(shen yin xu chen hai),
    %w(hai wei mao you zi),
    %w(shen chen shen wu zi),
    %w(you si si wei chou),
    %w(zi chou wu si chou),
    %w(you xu hai xu yin),
    %w(xu mao chen wei yin),
    %w(chou shen you shen mao),
    %w(xu si wu wu mao),
    %w(hai wu wei hai chen)][day_of_month-1][element_index]
  end
  
  def tian_fu
    Branch[(17-zi_wei.ordinal)%12 + 1]
  end

  def tian_xiang
    Branch[(tian_fu.ordinal+3)%12+1]
  end
  
  def tian_ji
    Branch[((zi_wei.ordinal+10)%12)+1]
  end

  def tai_yang
    Branch.[] ((zi_wei.ordinal+8)%12+1)
  end
  
  def wu_qu
    Branch.[] ((zi_wei.ordinal+7)%12+1)
  end
  
  def tai_yin
    Branch.[] ((tian_fu.ordinal)%12+1)
  end

  def ju_men
    Branch.[] ((tian_fu.ordinal+2)%12+1)
  end

  def tian_tong
    Branch.[] ((zi_wei.ordinal+6)%12+1)
  end
  
  def tian_liang
    Branch.[] ((tian_fu.ordinal+4)%12+1)
  end
  
  def wen_chang
    Branch[12 - ((hour.branch.ordinal) % 12)]
  end
  
  def wen_qu
    Branch.[] ((hour.ordinal+3)%12+1)
  end
  
  def lian_zhen
    Branch.[] ((zi_wei.ordinal+3)%12+1)
  end

  def tan_lang
    Branch.[] ((tian_fu.ordinal+1)%12+1)
  end
  
  def qi_sha
    Branch.[] ((tian_fu.ordinal+5)%12+1)
  end
  
  def po_jun
    Branch.[] ((tian_fu.ordinal+9)%12+1)
  end
  
  def huo_xing
    Branch.send [%w(yin mao chou you yin mao chou you yin mao chou you),
    %w(mao chen yin xu mao chen yin xu mao chen yin xu),
    %w(chen si mao hai chen si mao hai chen si mao hai),
    %w(si wu chen zi si wu chen zi si wu chen zi),
    %w(wu wei si chou wu wei si chou wu wei si chou),
    %w(wei shen wu yin wei shen wu yin wei shen wu yin),
    %w(shen you wei mao shen you wei mao shen you wei mao),
    %w(you xu shen chen you xu shen chen you xu shen chen),
    %w(xu hai you si xu hai you si xu hai you si),
    %w(hai zi xu wu hai zi xu wu hai zi xu wu),
    %w(zi chou hai wei zi chou hai wei zi chou hai wei),
    %w(chou yin zi shen chou yin zi shen chou yin zi shen)][hour.branch.ordinal-1][year.branch.ordinal-1]
  end
  
  def ling_xing
    Branch.send [%w(xu xu mao xu xu xu mao xu xu xu mao xu),
    %w(hai hai chen hai hai hai chen hai hai hai chen hai),
    %w(zi zi si zi zi zi si zi zi zi si zi),
    %w(chou chou wu chou chou chou wu chou chou chou wu chou),
    %w(yin yin wei yin yin yin wei yin yin yin wei yin),
    %w(mao mao shen mao mao mao shen mao mao mao shen mao),
    %w(chen chen you chen chen chen you chen chen chen you chen),
    %w(si si xu si si si xu si si si xu si),
    %w(wu wu hai wu wu wu hai wu wu wu hai wu),
    %w(wei wei zi wei wei wei zi wei wei wei zi wei),
    %w(shen shen chou shen shen shen chou shen shen shen chou shen),
    %w(you you yin you you you yin you you you yin you)][hour.branch.ordinal-1][year.branch.ordinal-1]
  end
  
  def yang_ren
    Branch.send(%w(mao chen wu wei wu wei you xu zi chou)[year.stem.ordinal-1])
  end

  def tuo_luo
    Branch.send(%w(chou yin chen si chen si wei shen xu hai)[year.stem.ordinal-1])
  end
  
  def you_bi
    Branch[(25-month.branch.ordinal)%12+1]
  end

  def zuo_fu
    Branch[(month.branch.ordinal + 12 + 1)%12+1]
  end
  
  def tian_cun
    Branch.send (%w(yin mao si wu si wu shen you hai zi)[year.stem.ordinal-1])
  end
  
  def tian_yao
    Branch[(10+month.branch.ordinal)%12+1]
  end
  
  def tian_kui
    Branch.send %w(chou zi hai you wei shen wei wu si mao)[year.stem.ordinal-1]
  end

  def tian_xi
    Branch.send %w(you shen wei wu si chen mao yin chou zi hai xu)[year.branch.ordinal-1]
  end
  
  def di_gong
    Branch.send %w(hai xu you shen wei wu si chen mao yin chou zi)[hour.branch.ordinal-1]
  end

  def tian_yue
    Branch.send %w(wei shen you hai chou zi chou yin mao si)[year.stem.ordinal-1]
  end
  
  def tian_xing
    Branch[(6+month.branch.ordinal)%12+1]
  end
  
  def di_jie
    Branch.send %w(hai zi chou yin mao chen si wu wei shen you xu)[hour.branch.ordinal-1]
  end
end