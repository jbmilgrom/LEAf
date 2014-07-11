class CreateSavedArticles < ActiveRecord::Migration
  def change
    create_table :saved_articles do |t|
      t.integer :user_id
      t.integer :article_id
      t.boolean :is_archived?
      t.boolean :is_favorited?
      t.string :tag_one
      t.string :tag_two
      t.string :tag_three
      t.string :tag_four
      t.string :tag_five

      t.timestamps
    end
  end
end
