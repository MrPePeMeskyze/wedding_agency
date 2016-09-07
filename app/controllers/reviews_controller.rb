class ReviewsController < ApplicationController
skip_before_filter :verify_authenticity_token, only: [:create]

##############################################################################
	def index
		@video_reviews = Albums.where('is_published = 1 and is_video_review = 1').first
		@object = Objects.where('objects_type_id = 6').first
		@reviews = Reviews.where('is_published = ? or session_id = ?', true, @oSession.id).order('created_at DESC').paginate(page: params[:page], per_page: 2)
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
	      	.permit(:fio, :body, :event, :date, :rate, :avatar)
	    end
##############################################################################
	
end
