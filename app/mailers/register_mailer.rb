class RegisterMailer < ActionMailer::Base
  default from: "register@starrzdance.com"

  def register_email(student, schedule)
  	@student = student
  	@schedule = schedule
    mail(to: "gsavale@yahoo.com", subject: "#{student.student_name} registered")
  end

end
