class StaticPagesController < ApplicationController
	include StaticPagesHelper

  	def home
  		puts "\n\nIN HOME\n\n"
  		@home = Static.where("title = ?", "home").first
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
			@student  = params[:student]
			@result = params[:result]
		else
			unless params[:result].nil?
				@result = params[:result]
			end
		end
		@schedule = Schedule.all
	end

	def register_new

		student = Student.new
		student.student_name = params[:student_name].strip
		student.age = params[:age].strip
		student.parent_name = params[:parent_name].strip
		student.email = params[:email].strip
		student.phone = clean_phone_input(params[:phone].strip)
		student.city = params[:city].strip
		student.state = params[:state].strip
		student.zipcode = params[:zipcode].strip
		student.schedule_id = params[:schedule]

		if student.save
			schedule = Schedule.find(student.schedule_id)
			schedule.enrolled = schedule.enrolled + 1
			schedule.save
			redirect_to action: 'register', :result => true
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
			
			redirect_to action: 'register', :student => student_value, :result => false
		end		
	end

	def photo
		@photo = Photo.all.sort_by(&:order)
	end

	def video
		@video = Video.all.sort_by(&:order)
	end
end
