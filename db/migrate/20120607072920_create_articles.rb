class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.string :title
      t.text :body
      t.string :slug
      t.datetime :date_posted

      t.timestamps
    end
  end
end
