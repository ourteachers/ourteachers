class School < ActiveRecord::Base
	has_many :teachers
	has_many :reviews, through: :teachers

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
