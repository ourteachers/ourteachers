class QualitiesReview < ActiveRecord::Base
	belongs_to :quality
	belongs_to :review
end
