post "/users" do
  user = User.new(params[:user])
  if user.save
    session[:user_id] = user.id
    redirect "/"
  else
    @errors = user.errors.full_messages
    erb :"users/new"
  end
end

get "/users/:id" do
  @user = User.find(params[:id])
  @recent_questions = @user.questions.all.order(created_at: :desc).limit(3)
  @recent_answers = @user.answers.all.order(created_at: :desc).limit(3)
  erb :'users/profile'
end
