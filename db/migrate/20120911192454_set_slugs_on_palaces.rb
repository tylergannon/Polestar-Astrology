class SetSlugsOnPalaces < ActiveRecord::Migration
  def up
    Palace.all.each do |palace|
      palace.name = palace.name
      palace.save
    end
  end

  def down
  end
end
