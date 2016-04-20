get "/questions" do
  @questions = Question.order(created_at: :desc)
  erb :'questions/index'
end

get '/questions/:id' do
  @question = Question.find(params[:id])
  erb :'questions/show'
end