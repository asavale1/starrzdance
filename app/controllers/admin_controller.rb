class AdminController < ApplicationController
	#before_action :authenticate_admin!

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
		sched.group = params[:group].strip
		sched.session = params[:session].strip
		sched.time = params[:time].strip
		sched.location = params[:location].strip
		sched.instructor = params[:instructor].strip
		sched.fee = params[:fee].strip
		sched.capacity = params[:capacity].strip
		sched.enrolled = params[:enrolled].strip
		
		if sched.save
			redirect_to action: 'schedule', :result => true
		else
			redirect_to action: 'schedule', :result => false
		end
	end

	def schedule_update

		sched = Schedule.find(params[:id])
		sched.group = params[:group].strip
		sched.session = params[:session].strip
		sched.time = params[:time].strip
		sched.location = params[:location].strip
		sched.instructor = params[:instructor].strip
		sched.fee = params[:fee].strip
		sched.capacity = params[:capacity].strip
		sched.enrolled = params[:enrolled].strip
		
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
		student.student_name = params[:student_name].strip
		student.parent_name = params[:parent_name].strip
		student.age = params[:age].strip
		student.email = params[:email].strip
		student.phone = params[:phone].strip
		student.city = params[:city].strip
		student.state = params[:state].strip
		student.zipcode = params[:zipcode].strip
		
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
		photo.title = params[:title].strip
		photo.caption = params[:caption].strip
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
		photo.title = params[:title].strip
		photo.caption = params[:caption].strip
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
		video.title = params[:title].strip
		video.caption = params[:caption].strip
		video.order = params[:order].to_i
		video.clip = params[:clip]

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
		video.title = params[:title].strip
		video.caption = params[:caption].strip
		video.order = params[:order].to_i

		if video.save
			redirect_to action: 'video', :result => true
		else	
			redirect_to action: 'video', :result => false
		end
	end
end
