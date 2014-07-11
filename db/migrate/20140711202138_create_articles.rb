class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.string :a_url
      t.string :title
      t.string :subtitle
      t.text :body
      t.string :picture

      t.timestamps
    end
  end
end
