class AdminController < ApplicationController
	def home
		puts "\n\nIN ADMIN HOME\n\n"
	end

	#
	# => Company Info Management
	#
	def about
		unless params[:result].nil?
			@result = params[:result]
		end

		@about = Static.where("title = ?", "about").first
		puts "\n\nIN ABOUT\n\n"
	end

	def about_new
		about = Static.new
		about.title = "about"
		about.body = params[:content]
		about.save

		puts "\n\nIN ABOUT NEW\n\n"
		redirect_to action: 'about', :result => true
	end

	def about_edit
		about = Static.where("title = ?", "about").first
		about.body = params[:content]
		about.save

		puts "\n\nIN ABOUT EDIT\n\n"
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
		puts "\n\nIN ACHIEVEMENTS\n\n"
	end

	def achievements_new
		achievements = Static.new
		achievements.title = "achievements"
		achievements.body = params[:content]
		achievements.save

		puts "\n\nIN ACHIEVEMENTS NEW\n\n"
		redirect_to action: 'achievements', :result => true
	end

	def achievements_edit
		achievements = Static.where("title = ?", "achievements").first
		achievements.body = params[:content]
		achievements.save

		puts "\n\nIN ACHIEVEMENTS EDIT\n\n"
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
		puts "\n\nIN SCHEDULE\n\n"
	end

	def schedule_new
		puts "\n\nIN SCHEDULE NEW\n\n"

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
		puts "\n\nIN SCHEDULE UPDATE\n\n"

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
			puts "\n\nUPDATE SUCCESS\n\n"
			redirect_to action: 'schedule', :result => true
		else
			puts "\n\nUPDATE FAIL\n\n"
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
		puts "\n\nIN FAQ\n\n"
		@faq = Static.where("title = ?", "faq").first
	end

	def faq_new
		puts "\n\nIN FAQ NEW\n\n"
		
		faq = Static.new
		faq.title = "faq"
		faq.body = params[:content]
		faq.save
		
		redirect_to action: 'faq', :result => true
	end

	def faq_edit
		puts "\n\nIN FAQ EDIT\n\n"
		
		faq = Static.where("title = ?", "faq").first
		faq.body = params[:content]		
		faq.save

		redirect_to action: 'faq', :result => true
	end

	#
	# => Students managment
	#
	def student
		@student = Student.all
	end

	def student_delete
		puts "\n\nIN STUDENT DELETE\n\n"
		redirect_to action: 'student'
	end

	def student_edit

	end

	#
	# => Photos management
	#

	def photo
		puts "\n\nIN PHOTO\n\n"
	end

	#
	# => Videos management
	#

	def video
		puts "\n\nIN VIDEO\n\n"
	end
end
