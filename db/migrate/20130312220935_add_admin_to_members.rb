class AddAdminToMembers < ActiveRecord::Migration
  def change
    add_column :members, :admin, :boolean
    Member.where(email: ['tgannon@gmail.com', 'darreng@mac.com']).update_all admin: true
  end
end
