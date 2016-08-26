class CreatePhotos < ActiveRecord::Migration
  def change
    create_table :photos do |t|
      t.text :name
      t.boolean :is_published, :default => true 
      t.string :image
      t.integer :sort_order, :default => 1
      t.integer :auser_id, :default => 0
      t.integer :album_id, :default => 0
      t.integer :service_id, :default => 0
	  
      t.timestamps
    end
  end
end
