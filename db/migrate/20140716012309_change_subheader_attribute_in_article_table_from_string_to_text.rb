class ChangeSubheaderAttributeInArticleTableFromStringToText < ActiveRecord::Migration
  def change
  	change_column :articles, :subheader,  :text
  end
end
