class AddPostIdtoArticlesTable < ActiveRecord::Migration
  def change
  	add_column :articles, :post_id, :integer
  end
end
