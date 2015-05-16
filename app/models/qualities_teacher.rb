class QualitiesTeacher < ActiveRecord::Base
	belongs_to :quality
	belongs_to :teacher
end
