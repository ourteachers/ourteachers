class Quality < ActiveRecord::Base
	has_many :qualities_reviews
	has_many :reviews, through: :qualities_reviews
end
