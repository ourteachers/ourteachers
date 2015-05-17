module ApplicationHelper
  def resource_name
    :user
  end

  def resource
    @resource ||= User.new
  end

  def devise_mapping
    @devise_mapping ||= Devise.mappings[:user]
  end

  def score_color score
		return "null" if (score == "?")
  	return "red" if (score >= 0 and score < 2)
  	return "yellow" if (score >= 2 and score < 4)
  	return "green" if (score >= 4 and score <= 5)
  	 	
  end
end
