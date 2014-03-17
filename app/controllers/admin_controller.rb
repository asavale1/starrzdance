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
		@faq = Faq.all
	end

	def faq_new
		faq = Faq.new
		faq.title = params[:title]
		faq.content = params[:content]
		faq.order = params[:order]

		puts "\n\n"
		puts faq.title
		puts faq.content
		puts faq.order

		faq.save
		puts "\n\nIN FAQ EDIT\n\n"
		redirect_to action: 'faq'
	end

	def faq_edit
		faq = Faq.find(params[:id])
		puts "\n\n"
		puts faq.title
		puts faq.content
		puts faq.order
		puts "\n\n"
		redirect_to action: 'faq'
	end

	def photo
		puts "\n\nIN PHOTO\n\n"
	end

	def video
		puts "\n\nIN VIDEO\n\n"
	end

end
