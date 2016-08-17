class Slides < ActiveRecord::Base

	validates :image, presence: true
	validates :name, presence: true

	mount_uploader :image, ImageUploader

end
