json.array!(@teachers) do |teacher|
  json.extract! teacher, :id, :first_name, :last_name, :gender, :number_of_reviews, :school_id
  json.url teacher_url(teacher, format: :json)
end
