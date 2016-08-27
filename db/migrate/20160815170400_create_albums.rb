class CreateAlbums < ActiveRecord::Migration
  def change
    create_table :albums do |t|
      t.text :name
      t.boolean :is_published, :default => true
      t.boolean :is_video, :default => false 
      t.boolean :is_photo, :default => false 
      t.integer :sort_order, :default => 1
      t.integer :auser_id, :default => 0
      t.boolean :is_video_review, :default => 0
      
      t.timestamps
    end
  end
end
