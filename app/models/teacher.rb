class Teacher < ActiveRecord::Base
	belongs_to :school
	has_many :reviews

	has_many :subjects_teachers
	has_many :subjects, through: :subjects_teachers
	
	has_many :qualities_teachers
	has_many :qualities, through: :qualities_teachers
	
	def name
		"#{first_name} #{last_name}"
	end
end
