class CreateEmails < ActiveRecord::Migration
  def change
    create_table :emails do |t|
      t.string :attachment
      t.text :body
      t.string :sender

      t.timestamps
    end
  end
end
