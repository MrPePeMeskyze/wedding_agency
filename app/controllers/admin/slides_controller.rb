##############################################################################
#	
##############################################################################
class Admin::SlidesController < Admin::AdminController

	def index
		@slides = Slides.all.order('is_published desc, sort_order')
	end


	
##############################################################################
	def new
		@slide = Slides.new
	end


	
##############################################################################
	def create
		@slide = Slides.new(slides_params)
		@slide.auser_id = @oUser.id
	    if @slide.save
	    	flash[:success] = "Фото для слайдера добавлено!"
	      	redirect_to admin_slides_path
	    else
	    	render :new
		end		
	end
	

	
##############################################################################
	def edit
		@slide = Slides.find_by_id(params[:id])
	end


	
##############################################################################
	def update
		@slide = Slides.find_by_id(params[:id])
		@slide.auser_id = @oUser.id
		if @slide.update_attributes(slides_params)
			flash[:success] = "Фото для слайдера успешно отредактированно!"
			redirect_to admin_slides_path
		else
			render :edit
		end
	end


	
##############################################################################
	def destroy
		Slides.find_by_id(params[:id]).destroy
		flash[:success] = "Фото для слайдера удалено!"
		redirect_to admin_slides_path
	end


	
##############################################################################
	private
	    def slides_params
	      params.require(:slides)
	      	.permit(:is_published, :sort_order, :image, :name, :header, :body)
	    end
##############################################################################
end