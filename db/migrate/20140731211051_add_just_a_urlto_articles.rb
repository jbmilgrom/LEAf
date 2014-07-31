class AddJustAUrltoArticles < ActiveRecord::Migration
  def change
  	add_column :articles, :just_a_url?, :boolean
  end
end
