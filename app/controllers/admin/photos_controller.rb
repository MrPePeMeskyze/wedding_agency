##############################################################################
#	
##############################################################################
class Admin::PhotosController < Admin::AdminController

	def index
		@photos = Photos.all.order('is_published desc, sort_order')
	end


	
##############################################################################
	def new
		@photo = Photos.new
	end


	
##############################################################################
	def create
		@photo = Photos.new(photos_params)
		@photo.auser_id = @oUser.id
	    if @photo.save
	    	flash[:success] = "Фото добавлено!"
	      	redirect_to admin_photos_path
	    else
	    	render :new
		end		
	end
	

	
##############################################################################
	def edit
		@photo = Photos.find_by_id(params[:id])
	end


	
##############################################################################
	def update
		@photo = Photos.find_by_id(params[:id])
		@photo.auser_id = @oUser.id
		if @photo.update_attributes(photos_params)
			flash[:success] = "Фото успешно отредактированно!"
			redirect_to admin_photos_path
		else
			render :edit
		end
	end


	
##############################################################################
	def destroy
		Photos.find_by_id(params[:id]).destroy
		flash[:success] = "Фото удалено!"
		redirect_to admin_photos_path
	end


	
##############################################################################
	private

	    def photos_params
	      params.require(:photos)
	      	.permit(:is_published, :sort_order, :image, :name)
	    end
##############################################################################
end