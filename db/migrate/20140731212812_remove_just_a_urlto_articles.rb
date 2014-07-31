class RemoveJustAUrltoArticles < ActiveRecord::Migration
  def change
  	remove_column :articles, :just_a_url?
  	add_column :articles, :received?, :boolean
  end
end
