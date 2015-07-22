class RegisterMailer < ActionMailer::Base
  default from: "register@starrzdance.com"

  def register_email(student, schedule)
  	@student = student
  	@schedule = schedule
    mail(to: "contact@starrzdance.com", subject: "#{student.student_name} registered")
  end

  def confirmation_email(student, schedule)
  	@student = student
  	@schedule = schedule
  	mail(to: @student.email, subject: "Workshop registration confirmed")
  end
end
