class ChangeHeaderColumnFromStringtoTextinArticlesTable < ActiveRecord::Migration
  def change
  	remove_column :articles, :header
  	add_column :articles, :header, :text
  end
end
