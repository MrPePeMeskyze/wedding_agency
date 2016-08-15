##############################################################################
#	
##############################################################################
class Admin::VideosController < Admin::AdminController

	def index
		@videos = Videos.all.order('is_published desc, sort_order')
	end


	
##############################################################################
	def new
		@videos = Videos.new
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

	    def videos_params
	      params.require(:videos)
	      	.permit(:is_published, :sort_order, :permalink, :name)
	    end
##############################################################################
end