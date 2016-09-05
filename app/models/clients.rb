class Clients < ActiveRecord::Base

	validates :name, presence: true

	mount_uploader :image, ClientUploader

end
