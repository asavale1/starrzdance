#
# group 		=> varchar(255)
# session		=> varchar(255)
# time 			=> varchar(255)
# location		=> varchar(255)
# instructor	=> varchar(255)
# fee			=> varchar(255)
# capacity 		=> integer
# enrolled		=> integer
# workshop		=> boolean
#

class Schedule < ActiveRecord::Base
	has_many :students, :dependent => :destroy

	validates :group, presence: true
	validates :session, presence: true
	validates :time, presence: true
	validates :location, presence: true
	validates :fee, presence: true, numericality: true
	validates :capacity, presence: true, numericality: { only_integer: true }
	validates :enrolled, numericality: { only_integer: true }
	#validates :workshop, presence: true
end
