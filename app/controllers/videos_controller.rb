class VideosController < ApplicationController

##############################################################################
	def index
		@object = Objects.where('objects_type_id = 5').first
		@albums = Albums.where('is_published = 1 and is_video = 1').order('sort_order ASC, created_at desc')
	end
	
	def view
		@video = Objects.where('objects_type_id = 5').first
		@album = Albums.find_by(permalink: params[:id], is_published: 1)
		@videos = @album.videos.where('is_published = 1').order('sort_order ASC, created_at desc').paginate(page: params[:page], per_page: 10)
	end
	
end
