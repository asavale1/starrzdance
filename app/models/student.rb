class Student < ActiveRecord::Base
	belongs_to :schedule

	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
	LETTERS_REGEX = /\A[\w ]+\Z/
	NUMBERS_REGEX = /\A[1-9+]\Z/

	validates :student_name, presence: true, format: {with: LETTERS_REGEX}
	validates :parent_name, format: {with: LETTERS_REGEX}, :allow_blank => true
	validates :email, presence: true, format: {with: VALID_EMAIL_REGEX}
	validates :phone, format: {with: NUMBERS_REGEX}, length: { is: 10}, :allow_blank => true
	validates :age, presence: true, format: {with: NUMBERS_REGEX}, length: { in: 1..3}
	validates :zipcode, format: {with: NUMBERS_REGEX}, length: { is: 5}, :allow_blank => true
	validates :city, format: {with: LETTERS_REGEX}, :allow_blank => true
	validates :state, format: {with: LETTERS_REGEX}, :allow_blank => true
	validates :schedule_id, presence: true
end
