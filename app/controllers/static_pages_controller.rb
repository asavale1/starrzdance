class StaticPagesController < ApplicationController
  	def home
  		puts "\n\nIN HOME\n\n"
	end

	def about
		puts "\n\nIN ABOUT\n\n"
	end

	def achievements
		puts "\n\nIN ACHIEVEMENTS\n\n"
	end

	def faq
		@faq = Static.where("title = ?", "faq").first
		puts "\n\nIN FAQS\n\n"
	end
end
