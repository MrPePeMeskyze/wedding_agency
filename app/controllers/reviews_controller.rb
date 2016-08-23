class ReviewsController < ApplicationController

##############################################################################
	def index
		@object = Objects.where('objects_type_id = 6').first
		@reviews = Reviews.where('is_published = 1').order('created_at ASC')
	end



##############################################################################
	def create
		@review = Reviews.new(reviews_params)
		@review.session_id = @oSession.id
	    if @review.save
	      	head :no_content
		end		
	end
	

	
##############################################################################
	private
	    def reviews_params
	      params.require(:reviews)
	      	.permit(:fio, :dignity, :limitations)
	    end
##############################################################################
	
end
