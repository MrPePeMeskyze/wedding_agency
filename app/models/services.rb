class Services < ActiveRecord::Base

	validates :header, presence: true, uniqueness: true
	validates :title, presence: true, uniqueness: true
	validates :permalink, uniqueness: true, presence: true
	
	mount_uploader :image, ImageUploader
	
	has_many :photos, -> { order "sort_order ASC" },
		class_name: "Photos", 
		foreign_key: "service_id"

end
