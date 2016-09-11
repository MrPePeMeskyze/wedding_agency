class Feedback < ActionMailer::Base

  	def contact(fio, email, phone, body)
        @fio = fio
        @email = email
        @phone = phone
        @body = body
        mail :to => 'irina_prazdnik@bk.ru', :from => email, :subject => "Письмо с сайта IrinaEvent" 
    end
end
