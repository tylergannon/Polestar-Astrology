class AddYinYangToPeople < ActiveRecord::Migration
  def change
    add_column :people, :yin_yang, :string

  end
end
