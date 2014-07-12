class ChangeArticlesTable < ActiveRecord::Migration
  def change
  	remove_column :articles, :title
  	add_column :articles, :header, :string
  	remove_column :articles, :subtitle
  	add_column :articles, :subheader, :string

  end
end
