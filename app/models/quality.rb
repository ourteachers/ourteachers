class Quality < ActiveRecord::Base
	has_many :qualities_teachers
	has_many :teachers, through: :qualities_teachers
end
