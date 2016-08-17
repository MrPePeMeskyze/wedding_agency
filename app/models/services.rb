class Services < ActiveRecord::Base

	validates :header, presence: true, uniqueness: true
	validates :title, presence: true, uniqueness: true
	validates :permalink, uniqueness: true, presence: true
	validates :image, presence: true
	validates :logo, presence: true

	mount_uploader :image, ImageUploader
	mount_uploader :logo, ImageUploader

end
