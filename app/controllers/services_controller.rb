class ServicesController < ApplicationController

##############################################################################
	def view
		@service = Services.find_by(permalink: params[:id], is_published: 1)
	end
	
end
