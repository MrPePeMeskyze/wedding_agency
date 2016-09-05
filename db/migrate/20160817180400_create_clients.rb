class CreateClients < ActiveRecord::Migration
  def change
    create_table :clients do |t|
      t.integer :sort_order
      t.boolean :is_published, :default => true
	  t.string :image
	  t.string :name
      t.timestamps
    end
  end
end