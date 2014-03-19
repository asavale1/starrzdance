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
end
