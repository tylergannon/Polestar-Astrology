class CreateFeedbacks < ActiveRecord::Migration
  def change
    create_table :feedbacks do |t|
      t.integer :member_id
      t.string :subject
      t.text :feedback

      t.timestamps
    end
  end
end
