class PagesController < ApplicationController
	before_action :init
	respond_to :html, :json
	skip_before_filter :verify_authenticity_token, only: [:sendmail]
##############################################################################
	def index
		@services = Services.where("is_published = ?", 1).order("sort_order ASC, header")
		@videos = Videos.where("is_published = ?", 1).order("sort_order ASC, name").limit(6)
		@photos = Photos.where("is_published = ?", 1).order("sort_order ASC, name").limit(8)
		@slides = Slides.where("is_published = ?", 1).order("sort_order ASC, name")
		@clients = Clients.where("is_published = ?", 1).order("sort_order ASC, name")
	end


	
##############################################################################
	def pages
	end



##############################################################################
	def sendmail
	      fio = params[:fio]
	      email = params[:email]
	      phone = params[:phone]
	      body = params[:body]
	      Feedback.contact(fio, email, phone, body).deliver 
	      head :no_content
	end



##############################################################################
	private
		def init
			## Перехват на 404, вызов exception
			if(!params[:id])
				@object = Objects.where("parent_id = ? AND is_published = ?", 0, 1).order("sort_order ASC").first
			else
				@object = Objects.find_by(full_path: params[:id], is_published: 1)
			end
			if(@object.blank?)
				render :template => '404', :status => 404
			end
		end
end
