class Photos < ActiveRecord::Base

	validates :image, presence: true
	validates :name, presence: true

	mount_uploader :image, ImageUploader

	belongs_to :album, class_name: "Albums", foreign_key: "album_id"
	belongs_to :service, class_name: "Services", foreign_key: "service_id"

end
