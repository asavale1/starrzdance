class AdminController < ApplicationController
	before_action :authenticate_admin!

	include AdminHelper

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
	# => Students managment
	#
	def student
		unless params[:result].nil?
			@result = params[:result]
		end
		@student = Student.all
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
		
		if student.schedule_id == params[:schedule_id]
			student.schedule_id = params[:schedule_id]
		else
			sched = Schedule.find(student.schedule_id)
			sched.enrolled = sched.enrolled - 1
			sched.save

			sched = Schedule.find(params[:schedule_id])
			sched.enrolled = sched.enrolled + 1
			sched.save

			student.schedule_id = params[:schedule_id]
		end

		if student.save
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
