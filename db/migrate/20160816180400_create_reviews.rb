class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.integer :session_id
      t.boolean :is_published, :default => false
      t.string :fio
      t.float :rate
	    t.string :event
	    t.string :avatar
	    t.date :date
      t.text :body
      t.timestamps
    end
  end
end