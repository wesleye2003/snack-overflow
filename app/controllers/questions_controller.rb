get "/questions" do
  @questions = Question.order(created_at: :desc)
  erb :'questions/index'
end

get "/questions/new" do
	erb :"questions/new"
end

post "/questions" do
	question = Question.new({
		title: params[:title],
		body: params[:body],
		user_id: current_user.id
		})
	if question.save
		question.add_tags(params[:tags])
		redirect "/questions/#{question.id}"
	else
		@errors = question.errors.full_messages
		erb :"questions/new"
	end
end

get "/questions/:id/edit" do
	@question = Question.find(params[:id])
	if current_user == @question.user
		erb :"questions/edit"
	else
		redirect "/"
	end
end

put "/questions/:id" do
	@question = Question.find(params[:id])
	if current_user == @question.user
		@question.update(params[:q])
		erb :"questions/show"
	else
		redirect "/"
	end
end

post "/questions/:id/answers" do
   @question = Question.find(params[:id])
   @question.answers.create({
    body: params[:body],
    user_id: current_user.id
    })
  redirect "/questions/#{@question.id}"
end

get '/questions/:id' do
  @question = Question.find(params[:id])
  erb :'questions/show'
end