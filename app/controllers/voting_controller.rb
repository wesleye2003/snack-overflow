post "/questions/:id/upvote" do
	question = Question.find(params[:id])
	if request.xhr? && current_user		
		question.votes.create(value: 1, user_id: current_user.id)
		content_type :json
		{data_id: question.id, point_value: question.total_points }.to_json
	elsif current_user
		question.votes.create(value: 1, user_id: current_user.id)
		redirect "/questions/#{question.id}"
	elsif request.xhr?
		400
	else
		redirect "/questions/#{question.id}"
	end
end

post "/questions/:id/downvote" do 
	question = Question.find(params[:id])
	if request.xhr? && current_user
		question.votes.create(value: -1, user_id: current_user.id)
		content_type :json
		{data_id: question.id, point_value: question.total_points }.to_json
	elsif current_user
		question.votes.create(value: -1, user_id: current_user.id)
		redirect "/questions/#{question.id}"
	elsif request.xhr?
		400
	else
		redirect "/questions/#{question.id}"
	end
end

post "/answers/:id/upvote" do 
	answer = Answer.find(params[:id])
	if request.xhr? && current_user
		answer.votes.create(value: 1, user_id: current_user.id)
		content_type :json
		{data_id: answer.id, point_value: answer.total_points }.to_json
	elsif current_user
		answer.votes.create(value: 1, user_id: current_user.id)
		redirect "/questions/#{answer.question.id}"
	elsif request.xhr?
		400
	else
		redirect "/questions/#{answer.question.id}"
	end
end

post "/answers/:id/downvote" do 
	answer = Answer.find(params[:id])
	if request.xhr? && current_user
		answer.votes.create(value: -1, user_id: current_user.id)
		content_type :json
		{data_id: answer.id, point_value: answer.total_points }.to_json
	elsif current_user
		answer.votes.create(value: -1, user_id: current_user.id)
		redirect "/questions/#{answer.question.id}"
	elsif request.xhr?
		400
	else
		redirect "/questions/#{answer.question.id}"
	end
end

