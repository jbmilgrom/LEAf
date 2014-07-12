class ChangePostsTable < ActiveRecord::Migration
  def change
  	add_column :posts, :a_url, :string
  end
end
