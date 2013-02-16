class CreateStarPalaceData < ActiveRecord::Migration
  def up
    Star.all.each do |star|
      Palace.all.each do |palace|
        StarPalace.create! star: star, palace: palace
      end
    end
  end

  def down
    StarPalace.destroy_all
  end
end
