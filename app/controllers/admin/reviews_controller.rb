##############################################################################
#	
##############################################################################
class Admin::ReviewsController < Admin::AdminController

	def index
		@reviews = Reviews.all.order('created_at DESC')
	end


	
##############################################################################
	def edit
		@review = Reviews.find_by_id(params[:id])
	end


	
##############################################################################
	def update
		@review = Reviews.find_by_id(params[:id])
		if @review.update_attributes(reviews_params)
			flash[:success] = "Отзыв успешно отредактирован!"
			redirect_to admin_reviews_path
		else
			render :edit
		end
	end


	
##############################################################################
	private
	    def reviews_params
	      params.require(:reviews)
	      	.permit(:fio, :body, :event, :date, :rate, :avatar, :is_published)
	    end
##############################################################################
end