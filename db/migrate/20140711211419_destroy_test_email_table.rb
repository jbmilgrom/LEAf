class DestroyTestEmailTable < ActiveRecord::Migration
  def change
  	drop_table :test_emails
  end
end
