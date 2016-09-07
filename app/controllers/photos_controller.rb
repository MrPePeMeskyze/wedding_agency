class PhotosController < ApplicationController

##############################################################################
	def index
		@object = Objects.where('objects_type_id = 4').first
		@albums = Albums.where('is_published = 1 and is_photo = 1').order('sort_order ASC')
	end

	def view
		@photo = Objects.where('objects_type_id = 4').first
		@album = Albums.find_by(permalink: params[:id], is_published: 1)
		@photos = @album.photos.where('is_published = 1').order('sort_order ASC').paginate(page: params[:page], per_page: 20)
	end
	
end
