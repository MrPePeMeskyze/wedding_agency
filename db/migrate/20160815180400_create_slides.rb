class CreateSlides < ActiveRecord::Migration
  def change
    create_table :slides do |t|
      t.text :name
      t.boolean :is_published, :default => true
      t.string :image
      t.integer :sort_order, :default => 1
      t.integer :auser_id, :default => 0
      t.string :header
      t.text :body
      
      t.timestamps
    end
  end
end
