class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.integer :session_id
      t.boolean :is_published, :default => false
      t.string :fio
      t.integer :rate
      t.text :dignity
      t.text :limitations  
      t.timestamps
    end
  end
end