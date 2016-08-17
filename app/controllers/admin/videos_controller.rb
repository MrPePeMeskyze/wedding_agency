##############################################################################
#	
##############################################################################
class Admin::VideosController < Admin::AdminController
	before_action :videos_ext, only: [:edit, :update, :new, :create]

	def index
		@videos = Videos.all.includes(:album).order('albums.sort_order is null, albums.sort_order, videos.is_published desc, videos.sort_order')
	end


	
##############################################################################
	def new
		@video = Videos.new
	end


	
##############################################################################
	def create
		@video = Videos.new(videos_params)
		@video.auser_id = @oUser.id
	    if @video.save
	    	flash[:success] = "Видео добавлено!"
	      	redirect_to admin_videos_path
	    else
	    	render :new
		end		
	end
	

	
##############################################################################
	def edit
		@video = Videos.find_by_id(params[:id])
	end


	
##############################################################################
	def update
		@video = Videos.find_by_id(params[:id])
		@video.auser_id = @oUser.id
		if @video.update_attributes(videos_params)
			flash[:success] = "Видео успешно отредактированно!"
			redirect_to admin_videos_path
		else
			render :edit
		end
	end


	
##############################################################################
	def destroy
		Videos.find_by_id(params[:id]).destroy
		flash[:success] = "Видео удалено!"
		redirect_to admin_videos_path
	end


	
##############################################################################
	private
		def videos_ext
			@albums = Albums.where("is_video = ? && is_published = ?", true, true).order(:sort_order, :name)
		end
	    def videos_params
	      params.require(:videos)
	      	.permit(:is_published, :sort_order, :permalink, :name, :album_id)
	    end
##############################################################################
end