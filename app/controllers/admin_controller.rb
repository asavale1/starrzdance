class AdminController < ApplicationController
	def home
		puts "\n\nIN ADMIN HOME\n\n"
	end

	def about
		puts "\n\nIN EDIT ABOUT\\n\n"
	end

	def achievements
		puts "\n\nIN ACHIEVEMENTS\n\n"
	end

	def schedule
		puts "\n\nIN SCHEDULE\n\n"
	end

	def faq
		puts "\n\nIN FAQ\n\n"
		@faq = Static.where("title = ?", "faq").first
	end

	def faq_new
		faq = Static.new
		faq.title = "faq"
		faq.body = params[:content]

		puts "\n\n"
		puts faq.title
		puts faq.body
		puts "\n\nIN FAQ EDIT\n\n"
		faq.save
		redirect_to action: 'faq'
	end

	def faq_edit
		faq = Static.where("title = ?", "faq").first
		faq.body = params[:content]
		puts "\n\n"
		puts "IN FAQ EDIT"
		faq.save
		redirect_to action: 'faq'
	end

	def photo
		puts "\n\nIN PHOTO\n\n"
	end

	def video
		puts "\n\nIN VIDEO\n\n"
	end

end
