class AddPermalinkToAlbum < ActiveRecord::Migration
  def change
    add_column :albums, :permalink, :string
  end
end