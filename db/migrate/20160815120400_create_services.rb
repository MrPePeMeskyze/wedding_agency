class CreateServices < ActiveRecord::Migration
  def change
    create_table :services do |t|
      t.string :title
      t.string :header
      t.text :body
      t.boolean :is_published, :default => true 
      t.string :permalink
      t.string :image
      t.string :logo_class
      t.integer :sort_order, :default => 1
      t.integer :auser_id, :default => 0
      t.text :meta_keywords
      t.text :meta_description
      
      t.timestamps
    end
  end
end
