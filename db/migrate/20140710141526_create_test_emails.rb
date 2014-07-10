class CreateTestEmails < ActiveRecord::Migration
  def change
    create_table :test_emails do |t|
      t.text :data
      
      t.timestamps
    end
  end
end
