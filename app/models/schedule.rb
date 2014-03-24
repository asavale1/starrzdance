class Schedule < ActiveRecord::Base
	has_many :students

	validates :group, presence: true
	validates :session, presence: true
	validates :time, presence: true
	validates :location, presence: true
	validates :fee, presence: true, numericality: true
	validates :capacity, presence: true, numericality: { only_integer: true }
	validates :enrolled, numericality: { only_integer: true }
end
