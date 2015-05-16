json.array!(@reviews) do |review|
  json.extract! review, :id, :child_happiness, :child_learning, :communication, :comments
  json.url review_url(review, format: :json)
end
