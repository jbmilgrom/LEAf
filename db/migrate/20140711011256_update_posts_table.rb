class UpdatePostsTable < ActiveRecord::Migration
  def change
  	remove_column :posts, :attachements
  	add_column :posts, :attachments, :text
  end
end
