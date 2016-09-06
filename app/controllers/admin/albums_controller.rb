##############################################################################
#	
##############################################################################
class Admin::AlbumsController < Admin::AdminController

	def index
		@albums = Albums.all.order('is_published desc, sort_order')
	end


	
##############################################################################
	def new
		@album = Albums.new
	end


	
##############################################################################
	def create
		@album = Albums.new(albums_params)
		@album.auser_id = @oUser.id
	    if @album.save
	    	flash[:success] = "Альбом добавлен!"
	      	redirect_to admin_albums_path
	    else
	    	render :new
		end		
	end
	

	
##############################################################################
	def edit
		@album = Albums.find_by_id(params[:id])
	end


	
##############################################################################
	def update
		@album = Albums.find_by_id(params[:id])
		@album.auser_id = @oUser.id
		if @album.update_attributes(albums_params)
			flash[:success] = "Альбом успешно отредактирован!"
			redirect_to admin_albums_path
		else
			render :edit
		end
	end


	
##############################################################################
	def destroy
		Albums.find_by_id(params[:id]).destroy
		flash[:success] = "Альбом удален!"
		redirect_to admin_albums_path
	end


	
##############################################################################
	private
	    def albums_params
	      params.require(:albums)
	      	.permit(:is_photo, :image, :is_video, :permalink, :is_published, :name, :sort_order, :is_video_review)
	    end
##############################################################################
end