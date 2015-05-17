# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

qualities_list = ["Engaging", "Charismatic", "Warm", "Passionate", "Inspiring", "Supportive", "Caring", 
	"Knowledgable about their subject", "Approachable", "Respectful", "Drill Sergeant", 
	"Accomodating", "Accessible", "Super-hero!", "Communicative", "Organized", "Patient", 
	"Teacher of the Year Material", "Deserves a Raise", "Strict", "Role Model", "Creative", "Leader", 
	"Trustworthy", "Fun", "Effective", "Professional", "Disorganized", "Tough", "High Expectations", "Fair", 
	"Surrogate Parent", "Judgmental", "Understanding", "Consistent", "Plays Favorites"]

qualities_list.each do |quality|
		q = Quality.find_or_create_by(name: quality)
		q.save
	end

	