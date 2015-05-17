class Review < ActiveRecord::Base
	belongs_to :user
	belongs_to :teacher
	has_many :qualities_reviews
	has_many :qualities, through: :qualities_reviews
end
