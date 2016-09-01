#
# student_name 	=> varchar(255)
# parent_name	=> varchar(255)
# email 		=> varchar(255)
# phone 		=> integer
# city			=> varchar(255)
# state			=> varchar(255)
# zipcode 		=> integer
# age			=> integer
# schedule_id	=> integer
# paid 			=> varchar(255)
#
class Student < ActiveRecord::Base
	belongs_to :schedule

	#VALID_EMAIL_REGEX = /\A([\w\.%\+\-]+)@([\w\-]+\.)+([\w]{2,})\Z/i
	LETTERS_REGEX = /\A[a-zA-Z ]+\Z/
	NUMBERS_REGEX = /\A[1-9+]\Z/

	validates :student_name, presence: true
	validates :email, presence: true
	validates :age, presence: true, numericality: { only_integer: true }
	validates :schedule_id, presence: true
	validates :paid, :inclusion => ["not paid", "online", "paid"]
end
