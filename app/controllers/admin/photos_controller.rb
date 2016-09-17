##############################################################################
#	
##############################################################################
class Admin::PhotosController < Admin::AdminController
	before_action :photos_ext, only: [:edit, :update, :new, :create]

	def index
		if params[:album_id]
			@photos = Photos.where("album_id = ?", params[:album_id]).order('photos.is_published desc, photos.sort_order, created_at desc')
		else
			@photos_without_albums = Photos.where('album_id = 0').order('photos.is_published desc, photos.sort_order, created_at desc')
			@albums = Albums.where("is_photo = 1").order('is_published desc, sort_order, created_at desc')
			@photos_general = Photos.all.order('photos.is_published desc, photos.sort_order, created_at desc').limit(8)
		end
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
	      	redirect_to admin_photos_path(album_id: @photo.album_id)
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
			redirect_to admin_photos_path(album_id: @photo.album_id)
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
		def photos_ext
			@albums = Albums.where("is_photo = ? && is_published = ?", true, true).order(:sort_order, :name)
			@services = Services.where("is_published = ?", true).order(:sort_order, :header)
		end
	    def photos_params
	      params.require(:photos)
	      	.permit(:is_published, :sort_order, :image, :name, :album_id, :service_id)
	    end
##############################################################################
end