class AdminController < ApplicationController
	before_action :authenticate_admin!

	include AdminHelper

	def admin
		puts params[:flash]
	end

	def admin_new
		admin = Admin.new
		admin.email = params[:email]
		admin.password = params[:password]
		admin.password_confirmation = params[:password_confirmation]
		if !(params[:email] =~ /^\S+@\S+$/)
			flash[:alert] = "Invalid email"
			redirect_to action: "admin"
		elsif params[:password].strip.empty?
			flash[:alert] = "Password cannot be blank"
			redirect_to action: "admin"
		elsif params[:password] != params[:password_confirmation]
			flash[:alert] = "Passwords do not match"
			redirect_to action: "admin"
		elsif params[:password].strip.length < 8
			flash[:alert] = "Password must be at least 8 characters long"
			redirect_to action: "admin"
		else
			admin.save!(:validate => false)
			flash[:notice] = "Admin created"
			redirect_to action: "admin"
		end
	end

	def home
		unless params[:result].nil?
			@result = params[:result]
		end

		@home = Static.where("title = ?", "home").first
	end

	def home_new
		home = Static.new
		home.title = "home"
		home.body = params[:content]
		home.save

		redirect_to action: 'home', :result => true
	end

	def home_edit
		home = Static.where("title = ?", "home").first
		home.body = params[:content]
		home.save

		redirect_to action: 'home', :result => true
	end

	#
	# => Company Info Management
	#
	def about
		unless params[:result].nil?
			@result = params[:result]
		end

		@about = Static.where("title = ?", "about").first
	end

	def about_new
		about = Static.new
		about.title = "about"
		about.body = params[:content]
		about.save

		redirect_to action: 'about', :result => true
	end

	def about_edit
		about = Static.where("title = ?", "about").first
		about.body = params[:content]
		about.save

		redirect_to action: 'about', :result => true
	end

	#
	# => Achievements Management
	#

	def achievements
		unless params[:result].nil?
			@result = params[:result]
		end

		@achievements = Static.where("title = ?", "achievements").first
	end

	def achievements_new
		achievements = Static.new
		achievements.title = "achievements"
		achievements.body = params[:content]
		achievements.save

		redirect_to action: 'achievements', :result => true
	end

	def achievements_edit
		achievements = Static.where("title = ?", "achievements").first
		achievements.body = params[:content]
		achievements.save

		redirect_to action: 'achievements', :result => true
	end

	#
	# => Schedule Management
	#

	def schedule

		unless params[:result].nil?
			@result = params[:result]
		end

		@schedule = Schedule.all.sort_by(&:id)
	end

	def schedule_new

		sched = Schedule.new
		sched.group = check_nil(params[:group])
		sched.session = check_nil(params[:session])
		sched.time = check_nil(params[:time])
		sched.location = check_nil(params[:location])
		sched.instructor = check_nil(params[:instructor])
		sched.fee = check_nil(params[:fee])
		sched.capacity = check_nil(params[:capacity])
		sched.enrolled = check_nil(params[:enrolled])
		sched.workshop = params[:workshop]
		
		if sched.save
			redirect_to action: 'schedule', :result => true
		else
			redirect_to action: 'schedule', :result => false
		end
	end

	def schedule_update

		sched = Schedule.find(params[:id])
		sched.group = check_nil(params[:group])
		sched.session = check_nil(params[:session])
		sched.time = check_nil(params[:time])
		sched.location = check_nil(params[:location])
		sched.instructor = check_nil(params[:instructor])
		sched.fee = check_nil(params[:fee])
		sched.capacity = check_nil(params[:capacity])
		sched.enrolled = check_nil(params[:enrolled])
		
		if sched.save
			redirect_to action: 'schedule', :result => true
		else
			redirect_to action: 'schedule', :result => false
		end
	end

	#
	# => FAQ Management
	#

	def faq
		unless params[:result].nil?
			@result = params[:result]
		end

		@faq = Static.where("title = ?", "faq").first
	end

	def faq_new		
		faq = Static.new
		faq.title = "faq"
		faq.body = params[:content]
		faq.save
		
		redirect_to action: 'faq', :result => true
	end

	def faq_edit		
		faq = Static.where("title = ?", "faq").first
		faq.body = params[:content]		
		faq.save

		redirect_to action: 'faq', :result => true
	end

	#
	# => Events management
	#

	def events
		unless params[:result].nil?
			@result = params[:result]
		end

		@events = Static.where("title = ? ", "events").first
	end

	def events_new
		event = Static.new
		event.title = "events"
		event.body = params[:content]
		event.save

		redirect_to action: "events", :result => true
	end

	def events_edit
		events = Static.where("title = ? ", "events").first
		events.body = params[:content]
		events.save

		redirect_to action: "events", :result => true
	end

	def testimonials
		unless params[:result].nil?
			@result = params[:result]
		end

		@testimonials = Testimonial.all
	end

	def testimonials_new
		testimonial = Testimonial.new
		testimonial.name = params[:name]
		testimonial.content = params[:content]
		testimonial.show = params[:show]
		testimonial.save

		redirect_to action: "testimonials", :result => true
	end

	def testimonials_edit
		testimonial = Testimonial.find(params[:id])
		testimonial.name = params[:name]
		testimonial.content = params[:content]
		testimonial.show = params[:show]
		testimonial.save

		redirect_to action: "testimonials", :result => true
	end

	#
	# => Students managment
	#
	def student
		unless params[:result].nil?
			@result = params[:result]
		end
		@student = Student.all
		@schedule = Schedule.all
	end

	def student_new
		student = Student.new
		student.student_name = check_nil(params[:student_name])
		student.parent_name = check_nil(params[:parent_name])
		student.age = check_nil(params[:age])
		student.email = check_nil(params[:email])
		student.phone = check_nil(params[:phone])
		student.city = check_nil(params[:city])
		student.state = check_nil(params[:state])
		student.zipcode = check_nil(params[:zipcode])
		student.schedule_id = params[:schedule]
		student.paid = params[:paid]
		if student.save
			sched = Schedule.find(params[:schedule])
			sched.enrolled = sched.enrolled + 1
			sched.save
			redirect_to action: 'student', :result => true
		else
			student.errors.full_messages.each do |error|
				puts "\n#{error}\n"
			end
			redirect_to action: 'student', :result => false
		end
	end

	def student_delete
		
		student = Student.find(params[:id])
		
		sched = Schedule.find(student.schedule_id)
		sched.enrolled = sched.enrolled - 1
		sched.save

		student.destroy

		redirect_to action: 'student', :result => true
	end

	def student_update

		student = Student.find(params[:id])
		student.student_name = check_nil(params[:student_name])
		student.parent_name = check_nil(params[:parent_name])
		student.age = check_nil(params[:age])
		student.email = check_nil(params[:email])
		student.phone = check_nil(params[:phone])
		student.city = check_nil(params[:city])
		student.state = check_nil(params[:state])
		student.zipcode = check_nil(params[:zipcode])
		student.paid = params[:paid]

		temp = student.schedule_id
		student.schedule_id = params[:schedule_id]

		if student.save
			unless student.schedule_id == temp
				sched = Schedule.find(student.schedule_id)
				sched.enrolled = sched.enrolled - 1
				sched.save

				sched = Schedule.find(params[:schedule_id])
				sched.enrolled = sched.enrolled + 1
				sched.save
			end
			redirect_to action: 'student', :result => true
		else
			redirect_to action: 'student', :result => false
		end
	end

	#
	# => Photos management
	#

	def photo
		unless params[:result].nil?
			@result = params[:result]
		end
		@photo = Photo.all
	end

	def photo_new
		photo = Photo.new
		photo.title = check_nil(params[:title])
		photo.caption = check_nil(params[:caption])
		photo.order = params[:order].to_i
		photo.home = (params[:home] == "true")? true : false
		photo.image = params[:image]

		if photo.save
			redirect_to action: 'photo', :result => true
		else
			redirect_to action: 'photo', :result => false
		end
	end

	def photo_delete
		Photo.find(params[:id]).destroy
		redirect_to action: 'photo', :result => true
	end

	def photo_edit
		photo = Photo.find(params[:id])
		photo.title = check_nil(params[:title])
		photo.caption = check_nil(params[:caption])
		photo.order = params[:order].to_i
		photo.home = (params[:home] == "true")? true : false

		if photo.save
			redirect_to action: 'photo', :result => true
		else
			redirect_to action: 'photo', :result => false
		end
	end

	#
	# => Videos management
	#

	def video
		unless params[:result].nil?
			@result = params[:result]
		end

		@video = Video.all
	end

	def video_new
		video = Video.new
		video.title = check_nil(params[:title])
		video.caption = check_nil(params[:caption])
		video.order = params[:order].to_i
		video.clip = params[:clip]
		video.url = parse_url(check_nil(params[:url]))
		video.thumbnail = get_thumbnail(check_nil(params[:url]))

		if video.save
			redirect_to action: 'video', :result => true
		else
			video.errors.full_messages.each do |error|
				puts "\n#{error}\n"
			end
			redirect_to action: 'video', :result => false
		end		
	end

	def video_delete
		Video.find(params[:id]).destroy
		redirect_to action: 'video', :result => true
	end

	def video_edit
		video = Video.find(params[:id])
		video.title = check_nil(params[:title])
		video.caption = check_nil(params[:caption])
		video.order = params[:order].to_i

		if video.save
			redirect_to action: 'video', :result => true
		else	
			redirect_to action: 'video', :result => false
		end
	end

end
