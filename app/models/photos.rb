class Photos < ActiveRecord::Base

	validates :image, presence: true
	validates :name, presence: true

	mount_uploader :image, ImageUploader

	belongs_to :album, class_name: "Albums", foreign_key: "album_id"

end
