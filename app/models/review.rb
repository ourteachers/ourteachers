class Review < ActiveRecord::Base
	belongs_to :user
	belongs_to :teacher
	has_many :qualities_reviews
	has_many :qualities, through: :qualities_reviews

	def average_score
		((child_happiness.to_i + child_learning.to_i + communication.to_i) / 3)
	end
end
