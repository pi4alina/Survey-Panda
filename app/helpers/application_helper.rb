module ApplicationHelper
	def authorized?(survey)
		survey.author_id == session[:user_id]
	end
end
