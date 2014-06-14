class Student < ActiveRecord::Base
	belongs_to :schedule

	#VALID_EMAIL_REGEX = /\A([\w\.%\+\-]+)@([\w\-]+\.)+([\w]{2,})\Z/i
	LETTERS_REGEX = /\A[a-zA-Z ]+\Z/
	NUMBERS_REGEX = /\A[1-9+]\Z/

	validates :student_name, presence: true, format: {with: LETTERS_REGEX}
	validates :parent_name, format: {with: LETTERS_REGEX}, :allow_blank => true
	validates :email, presence: true
	validates :phone, numericality: { only_integer: true}, length: { is: 10}, :allow_blank => true
	validates :age, presence: true, numericality: { only_integer: true }
	validates :zipcode, numericality: { only_integer: true }, length: { is: 5}, :allow_blank => true
	validates :city, format: {with: LETTERS_REGEX}, :allow_blank => true
	validates :state, format: {with: LETTERS_REGEX}, :allow_blank => true
	validates :schedule_id, presence: true
	validates :paid, :inclusion => ["not paid", "online", "paid"]
end
