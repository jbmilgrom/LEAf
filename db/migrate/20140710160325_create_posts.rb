class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :to
      t.string :from
      t.string :subject
      t.text :body
      t.text :raw_body

      t.timestamps
    end
  end
end
