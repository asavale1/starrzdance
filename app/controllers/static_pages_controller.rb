require "json"


class StaticPagesController < ApplicationController
	
	include StaticPagesHelper

  	def home
  		puts "\n\n"
  		puts Student.last.student_name
  		puts Schedule.last.group
  		#RegisterMailer.register_email(Student.last, Schedule.find(Student.last.schedule_id)).deliver
  		puts "\n\n"
  		@home = Static.where("title = ?", "home").first
	end

	def about
		@about = Static.where("title = ?", "about").first
	end

	def achievements
		@achievements = Static.where("title = ?", "achievements").first
	end

	def faq
		@faq = Static.where("title = ?", "faq").first
	end

	def schedule
		@schedule = Schedule.all
	end

	def register

		unless params[:notification].nil?
			@result = params[:notification]["result"]
			@message = params[:notification]["message"]
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

		
		if params[:submit] == "Register"
			student.paid = "not paid"
			student.save

			schedule = Schedule.find(student.schedule_id)
			schedule.enrolled = schedule.enrolled + 1
			schedule.save
			
			redirect_to action: 'register', :notification => {
				:result => true, :message => "Registration Successful" }
		else
			student.paid = "online"
			student.save
			
			schedule = Schedule.find(student.schedule_id)
			schedule.enrolled = schedule.enrolled + 1
			schedule.save

			order_info =	{ 	:fees => schedule.fee,
								:name => student.student_name,
								:email => student.email,
								:group => schedule.group,
								:time => schedule.time,
								:location => schedule.location,
								:id => schedule.id
							}
			redirect_to action: "review", order_info: order_info
			
		end
				
	end

	def review
		@order_info = params[:order_info]

	end

	def photo
		@photo = Photo.all.sort_by(&:order)
	end

	def video
		@video = Video.all.sort_by(&:order)
	end

end
