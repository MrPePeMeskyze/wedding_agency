##############################################################################
#	
##############################################################################
class Admin::ServicesController < Admin::AdminController

	def index
		@services = Services.all.order('is_published desc, sort_order')
	end


	
##############################################################################
	def new
		@service = Services.new
	end


	
##############################################################################
	def create
		@service = Services.new(services_params)
		@service.auser_id = @oUser.id
	    if @service.save
	    	flash[:success] = "Услуга создана!"
	      	redirect_to admin_services_path
	    else
	    	render :new
		end		
	end
	

	
##############################################################################
	def edit
		@service = Services.find_by_id(params[:id])
	end


	
##############################################################################
	def update
		@service = Services.find_by_id(params[:id])
		@service.auser_id = @oUser.id
		if @service.update_attributes(services_params)
			flash[:success] = "Услуга успешно отредактирована!"
			redirect_to admin_services_path
		else
			render :edit
		end
	end


	
##############################################################################
	def destroy
		Services.find_by_id(params[:id]).destroy
		flash[:success] = "Услуга удалена!"
		redirect_to admin_services_path
	end


	
##############################################################################
	private
	    def services_params
	      params.require(:services)
	      	.permit(:title, :header, :logo_class, :body, :is_published, :permalink, :image, :sort_order, :meta_keywords, :meta_description)
	    end
##############################################################################
end