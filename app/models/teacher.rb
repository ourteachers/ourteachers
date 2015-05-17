class Teacher < ActiveRecord::Base
	belongs_to :school
	has_many :reviews

	has_many :subjects_teachers
	has_many :subjects, through: :subjects_teachers
	
	has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/no-avatar.png"
  	validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/

	def name
		"#{first_name} #{last_name}"
	end

	def aggregate_score
		review_count = self.reviews.count
		total_score = 0
		self.reviews.each do |review|
			total_score += review.average_score
		end
		if review_count > 0
			(total_score / review_count).round(1)
		else
			"?"
		end
	end
end
