class StaticPagesController < ApplicationController
  	def home
  		puts "\n\nIN HOME\n\n"
	end

	def about
		@about = Static.where("title = ?", "about").first
		puts "\n\nIN ABOUT\n\n"
	end

	def achievements
		@achievements = Static.where("title = ?", "achievements").first
		puts "\n\nIN ACHIEVEMENTS\n\n"
	end

	def faq
		@faq = Static.where("title = ?", "faq").first
		puts "\n\nIN FAQS\n\n"
	end

	def schedule
		@schedule = Schedule.all
		puts "\n\nIN SCHEDULE\n\n"
	end

	def register
		@schedule = Schedule.all
		puts "\n\nIN REGISTER\n\n"
	end

	def register_new
		puts "\n\nIN REGISTER NEW\n\n"

		puts "#{params[:student_name]}"
		puts "#{params[:parent_name]}"
		puts "#{params[:email]}"
		puts "#{params[:phone]}"
		puts "#{params[:city]}"
		puts "#{params[:state]}"
		puts "#{params[:zipcode]}"
		puts "#{params[:schedule]}"
		puts "\n\n"
		redirect_to action: 'register'
	end
end
