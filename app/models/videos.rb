class Videos < ActiveRecord::Base

	validates :permalink, presence: true, uniqueness: true
	validates :name, presence: true

	belongs_to :album, class_name: "Albums", foreign_key: "album_id"

end
