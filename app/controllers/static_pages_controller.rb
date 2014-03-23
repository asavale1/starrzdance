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
		unless params[:student].nil?
			puts "\n\nREGISTER FAIL:\t#{params[:student]}\n\n"
			puts "#{params[:student]['email']}"
			@student  = params[:student]
		end
		@schedule = Schedule.all
		puts "\n\nIN REGISTER\n\n"
	end

	def register_new
		
		student = Student.new
		student.student_name = params[:student_name].strip
		student.age = params[:age].strip
		student.parent_name = params[:parent_name].strip
		student.email = params[:email].strip
		student.phone = params[:phone].strip
		student.city = params[:city].strip
		student.state = params[:state].strip
		student.zipcode = params[:zipcode].strip
		student.schedule_id = params[:schedule]

		puts "\n\nIN REGISTER NEW\n\n"

		puts "#{params[:student_name]}"
		puts "#{params[:age]}"
		puts "#{params[:parent_name]}"
		puts "#{params[:email]}"
		puts "#{params[:phone]}"
		puts "#{params[:city]}"
		puts "#{params[:state]}"
		puts "#{params[:zipcode]}"
		puts "#{params[:schedule]}"
		puts "\n\n"

		if student.save
			puts "\n\nSAVE SUCCESS\n\n"
			redirect_to action: 'register'
		else

			index = 0
			errors = Hash.new
			temp = student.errors.to_hash
			temp.each_pair do |msg|
				errors[msg[0]] = msg[1][0]
			end


			student_value = {	"student" => student.student_name,
								"age" => student.age,
						 		"parent" => student.parent_name,
						 		"email" => student.email,
						 		"phone" => student.phone,
						 		"city" => student.city,
						 		"state" => student.state,
						 		"zipcode" => student.zipcode,
						 		"schedule" => student.schedule_id,
						 		"errors" => errors
							}
			
			puts "\n\nSAVE FAIL\n\n"
			redirect_to action: 'register', :student => student_value
		end		
	end
end
