class PagesController < ApplicationController
	before_action :init
##############################################################################
	def index
		$services = Services.where("is_published = ?", 1).order("sort_order ASC, header")
		$videos = Videos.where("is_published = ?", 1).order("sort_order ASC, header").limit(6)
		$photos = Photos.where("is_published = ?", 1).order("sort_order ASC, header").limit(8)
	end


	
##############################################################################
	def pages
	end



##############################################################################

	private
		def init
			## Перехват на 404, вызов exception
			if(!params[:id])
				@object = Objects.where("parent_id = ? AND is_published = ?", 0, 1).order("sort_order ASC").first
			else
				@object = Objects.find_by(full_path: params[:id], is_published: 1)
			end
			if(@object.blank?)
				render :template => '404', :status => 404
			end
		end
end
