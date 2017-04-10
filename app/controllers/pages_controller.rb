class PagesController < ApplicationController
	before_action :init
	respond_to :html, :json
	skip_before_filter :verify_authenticity_token, only: [:sendmail]

##############################################################################
	def verify_google_recptcha(secret_key,response)
		status = `curl "https://www.google.com/recaptcha/api/siteverify?secret=#{secret_key}&response=#{response}"`
		hash = JSON.parse(status)
		hash["success"] == true ? true : false
	end
##############################################################################
	def index
		@services = Services.where("is_published = ?", 1).order("sort_order ASC, header")
		@videos = Videos.where("is_published = ?", 1).order("sort_order ASC, created_at desc").limit(6)
		@photos = Photos.where("is_published = ?", 1).order("sort_order ASC, created_at desc").limit(8)
		@slides = Slides.where("is_published = ?", 1).order("sort_order ASC, created_at desc")
		@clients = Clients.where("is_published = ?", 1).order("sort_order ASC, created_at desc")
		@about_me = Objects.where("id = 3 or permalink = 'about'").first
		@why_me = Objects.where("id = 4 or permalink = 'why_me'").first
	end


	
##############################################################################
	def pages
	end



##############################################################################
	def sendmail

		status = verify_google_recptcha("6LeNUxwUAAAAALRcvk0JxGVxI2AlSoT_tbilphH1", params["resp"])

		respond_to do |format|
			check_fio = 0
			check_mail = 0
			check_body = 0

			if (params[:fio] != nil && params[:fio] != "")
				check_fio = 1
			end

			if (params[:email] != nil && params[:email] != "")
				check_mail = 1
			end

			if (params[:body] != nil && params[:body] != "")
				check_body = 1
			end 

			rez = {"json_fio" => check_fio, "json_mail" => check_mail, "json_body" => check_body, "status" => status}

			if (check_body == 1 && check_mail == 1 && check_fio == 1 && status == true)
				format.html { redirect_to :back, notice: "Письмо успешно отправлено!"}
				format.json { render json: rez}

				fio = params[:fio]
				email = params[:email]
				phone = params[:phone]
				body = params[:body]
				Feedback.contact(fio, email, phone, body).deliver 
			else
				format.html { render :back, notice: "Ошибка сервера!" }
				format.json { render json: rez}
			end
		end
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
