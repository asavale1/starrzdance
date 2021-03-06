require "json"


class StaticPagesController < ApplicationController
	
	include StaticPagesHelper

  	def home
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

	def events
		@events = Static.where('title = ?', 'events').first
	end

	def testimonials
		unless params[:result].nil?
			@result = params[:result]
		end
		@testimonials = Testimonial.where("show = ?", true)
	end

	def testimonials_new
		testimonial = Testimonial.new
		testimonial.name = params[:name]
		testimonial.content = params[:content]
		testimonial.show = false
		puts testimonial
		testimonial.save

		redirect_to action: "testimonials", :result => true
	end

	def schedule
		@schedule = Schedule.all
	end

	def register

		unless params[:notification].nil?
			@result = params[:notification]["result"]
			@message = params[:notification]["message"]
		end
		@schedule = Schedule.where(:workshop => false)
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
			student.save!

			schedule = Schedule.find(student.schedule_id)
			schedule.enrolled = schedule.enrolled + 1
			schedule.save
			
			RegisterMailer.register_email(student, schedule).deliver
			redirect_to action: 'register', :notification => {
				:result => true, :message => "Registration Successful" }
		else
			student.paid = "online"
			student.save!
			
			schedule = Schedule.find(student.schedule_id)
			schedule.enrolled = schedule.enrolled + 1
			schedule.save!

			order_info =	{ 	:fees => schedule.fee,
								:name => student.student_name,
								:email => student.email,
								:group => schedule.group,
								:time => schedule.time,
								:location => schedule.location,
								:id => schedule.id
							}

			RegisterMailer.register_email(student, schedule).deliver
			redirect_to action: "review", order_info: order_info
			
		end
				
	end

	def workshop
		unless params[:notification].nil?
			@result = params[:notification]["result"]
			@message = params[:notification]["message"]
		end
		@scheduled = Schedule.where(:workshop => true)

	end

	def workshop_register
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
			
			RegisterMailer.register_email(student, schedule).deliver
			RegisterMailer.confirmation_email(student, schedule).deliver

			redirect_to action: 'workshop', :notification => {
				:result => true, :message => "Registration Successful" }
		else
			student.paid = "online"
			student.save
			
			schedule = Schedule.find(student.schedule_id)
			schedule.enrolled = schedule.enrolled + 1
			schedule.save

			RegisterMailer.register_email(student, schedule).deliver
			RegisterMailer.confirmation_email(student, schedule).deliver

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
