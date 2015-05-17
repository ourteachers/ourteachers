class School < ActiveRecord::Base
	has_many :teachers
	has_many :reviews, through: :teachers

	def aggregate_score
		review_count = self.reviews.count
		total_score = 0.00
		self.reviews.each do |review|
			total_score += review.average_score
		end
		if review_count > 0
			(total_score / review_count).round(1)
		else
			"?"
		end
	end

	def aggregate_happiness
		total_score = 0.00
		self.reviews.each do |review|
			total_score += (review.child_happiness.to_f / 5.00)
		end
		if self.reviews.count > 0
			(total_score / self.reviews.count) * 100
		else
			0
		end
	end

	def aggregate_learning
		total_score = 0.00
		self.reviews.each do |review|
			total_score += (review.child_learning.to_f / 5.00)
		end
		if self.reviews.count > 0
			(total_score / self.reviews.count) *100
		else
			0
		end
	end

	def aggregate_communication
		total_score = 0.00
		self.reviews.each do |review|
			total_score += (review.communication.to_f / 5.00)
		end
		if self.reviews.count > 0
			(total_score / self.reviews.count) * 100
		else
			0
		end
	end	

end
