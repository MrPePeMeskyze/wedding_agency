class CreateVideos < ActiveRecord::Migration
  def change
    create_table :videos do |t|
      t.text :name
      t.boolean :is_published, :default => true
      t.string :permalink
      t.integer :sort_order, :default => 1
      t.integer :auser_id, :default => 0
      t.integer :album_id, :default => 0
      
      t.timestamps
    end
  end
end
