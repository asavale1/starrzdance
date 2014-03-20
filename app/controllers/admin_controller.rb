class AdminController < ApplicationController
	def home
		puts "\n\nIN ADMIN HOME\n\n"
	end

	#
	# => Company Info Management
	#
	def about
		@about = Static.where("title = ?", "about").first
		puts "\n\nIN ABOUT\n\n"
	end

	def about_new
		about = Static.new
		about.title = "about"
		about.body = params[:content]
		about.save

		puts "\n\nIN ABOUT NEW\n\n"
		redirect_to action: 'about'
	end

	def about_edit
		about = Static.where("title = ?", "about").first
		about.body = params[:content]
		about.save

		puts "\n\nIN ABOUT EDIT\n\n"
		redirect_to action: 'about'
	end

	#
	# => Achievements Management
	#

	def achievements
		@achievements = Static.where("title = ?", "achievements").first
		puts "\n\nIN ACHIEVEMENTS\n\n"
	end

	def achievements_new
		achievements = Static.new
		achievements.title = "achievements"
		achievements.body = params[:content]
		achievements.save

		puts "\n\nIN ACHIEVEMENTS NEW\n\n"
		redirect_to action: 'achievements'
	end

	def achievements_edit
		achievements = Static.where("title = ?", "achievements").first
		achievements.body = params[:content]
		achievements.save

		puts "\n\nIN ACHIEVEMENTS EDIT\n\n"
		redirect_to action: 'achievements'
	end

	def schedule
		puts "\n\nIN SCHEDULE\n\n"
	end

	#
	# => FAQ Management
	#

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
