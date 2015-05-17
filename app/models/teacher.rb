class Teacher < ActiveRecord::Base
	belongs_to :school
	has_many :reviews

	has_many :subjects_teachers
	has_many :subjects, through: :subjects_teachers
	
	def name
		"#{first_name} #{last_name}"
	end

	def avatar
		"/images/no-avatar.png"
	end

	def aggregate_score
		review_count = self.reviews.count
		total_score = 0
		self.reviews.each do |review|
			total_score += review.average_score
		end
		if review_count > 0
			total_score / review_count
		else
			"?"
		end
	end
end
