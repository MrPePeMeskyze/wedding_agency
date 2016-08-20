class ServicesController < ApplicationController

##############################################################################
	def view
		@service = Services.find_by_permalink(request.path)
	end
	
end
