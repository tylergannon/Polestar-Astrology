class AddBranchesToPeople < ActiveRecord::Migration
  def change
    add_column :people, :year_branch_id, :integer
    add_column :people, :hour_branch_id, :integer
  end
end
