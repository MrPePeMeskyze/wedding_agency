class Albums < ActiveRecord::Base

	validates :name, presence: true

	has_many :albums,
		class_name: "Photos", 
		foreign_key: "album_id"

	has_many :videos,
		class_name: "Videos", 
		foreign_key: "album_id"
end
