class Review < ActiveRecord::Base
	belongs_to :user
	belongs_to :teacher
	has_many :qualities_reviews
	has_many :qualities, through: :qualities_reviews

	def average_score
		((child_happiness.to_f + child_learning.to_f + communication.to_f) / 3.00)
	end
end
