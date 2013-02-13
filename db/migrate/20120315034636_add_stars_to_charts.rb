class AddStarsToCharts < ActiveRecord::Migration
  def change
    add_column :charts, :ming_id, :integer

    add_column :charts, :zi_wei_id, :integer

    add_column :charts, :tian_fu_id, :integer

    add_column :charts, :tian_xiang_id, :integer

    add_column :charts, :tian_ji_id, :integer

    add_column :charts, :tai_yang_id, :integer

    add_column :charts, :wu_qu_id, :integer

    add_column :charts, :tai_yin_id, :integer

    add_column :charts, :ju_men_id, :integer

    add_column :charts, :tian_tong_id, :integer

    add_column :charts, :tian_liang_id, :integer

    add_column :charts, :wen_chang_id, :integer

    add_column :charts, :wen_qu_id, :integer

    add_column :charts, :lian_zhen_id, :integer

    add_column :charts, :tan_lang_id, :integer

    add_column :charts, :qi_sha_id, :integer

    add_column :charts, :po_jun_id, :integer

    add_column :charts, :huo_xing_id, :integer

    add_column :charts, :ling_xing_id, :integer

    add_column :charts, :yang_ren_id, :integer

    add_column :charts, :tuo_luo_id, :integer

    add_column :charts, :you_bi_id, :integer

    add_column :charts, :zuo_fu_id, :integer

    add_column :charts, :tian_cun_id, :integer

    add_column :charts, :tian_yao_id, :integer

    add_column :charts, :tian_kui_id, :integer

    add_column :charts, :tian_xi_id, :integer

    add_column :charts, :di_gong_id, :integer

    add_column :charts, :tian_yue_id, :integer

    add_column :charts, :tian_xing_id, :integer

    add_column :charts, :di_jie_id, :integer

    add_column :charts, :yi_ma_id, :integer

  end
end
