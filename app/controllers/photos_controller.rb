class PhotosController < ApplicationController

##############################################################################
	def index
		@object = Objects.where('objects_type_id = 4').first
		@albums = Albums.where('is_published = 1 and is_photo = 1').order('sort_order ASC')
	end
	
end
