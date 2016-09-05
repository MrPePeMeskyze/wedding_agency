##############################################################################
#	
##############################################################################
class Admin::ClientsController < Admin::AdminController

	def index
		@clients = Clients.all.order('is_published desc, sort_order')
	end


	
##############################################################################
	def new
		@client = Clients.new
	end


	
##############################################################################
	def create
		@client = Clients.new(clients_params)
	    if @client.save
	    	flash[:success] = "Клиент создан!"
	      	redirect_to admin_clients_path
	    else
	    	render :new
		end		
	end
	

	
##############################################################################
	def edit
		@client = Clients.find_by_id(params[:id])
	end


	
##############################################################################
	def update
		@client = Clients.find_by_id(params[:id])
		if @client.update_attributes(clients_params)
			flash[:success] = "Клиент успешно отредактирован!"
			redirect_to admin_clients_path
		else
			render :edit
		end
	end


	
##############################################################################
	def destroy
		Clients.find_by_id(params[:id]).destroy
		flash[:success] = "Клиент удален!"
		redirect_to admin_clients_path
	end


	
##############################################################################
	private
	    def clients_params
	      params.require(:clients)
	      	.permit(:is_published, :name, :sort_order, :image)
	    end
##############################################################################
end