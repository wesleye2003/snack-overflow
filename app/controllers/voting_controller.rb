post "/questions/:id/upvote" do 
	question = Question.find(params[:id])
	if current_user
		question.votes.create(value: 1)

		redirect "/questions/#{question.id}"
	else
		redirect "/questions/#{question.id}"
	end
end

post "/questions/:id/downvote" do 
	question = Question.find(params[:id])
	if current_user
		question.votes.create(value: -1)

		redirect "/questions/#{question.id}"
	else
		redirect "/questions/#{question.id}"
	end
end

post "/answers/:id/upvote" do 
	answer = Answer.find(params[:id])
	if current_user
		answer.votes.create(value: 1)

		redirect "/questions/#{answer.question.id}"
	else
		redirect "/questions/#{answer.question.id}"
	end
end

post "/answers/:id/downvote" do 
	if current_user
		answer.votes.create(value: -1)

		redirect "/questions/#{answer.question.id}"
	else
		redirect "/questions/#{answer.question.id}"
	end
end

