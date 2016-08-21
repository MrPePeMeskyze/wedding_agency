class VideosController < ApplicationController

##############################################################################
	def index
		@object = Objects.where('objects_type_id = 5').first
		@albums = Albums.where('is_published = 1 and is_video = 1').order('sort_order ASC')
	end
	
end
