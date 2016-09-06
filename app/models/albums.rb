class Albums < ActiveRecord::Base

	validates :image, presence: true
	validates :name, presence: true
	validates :permalink, uniqueness: true, presence: true

	mount_uploader :image, AlbumUploader

	has_many :photos,
		class_name: "Photos", 
		foreign_key: "album_id"

	has_many :videos,
		class_name: "Videos", 
		foreign_key: "album_id"
end
