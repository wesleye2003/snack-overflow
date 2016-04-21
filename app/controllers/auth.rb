get '/' do
  redirect '/questions'
end

get '/login' do
  erb :login
end

post '/login' do
    user = User.find_by(username: params[:username])
    user = user.authenticate(params[:password]) if user
  if request.xhr?
    erb :'users/_login', locals: {current_user: current_user}, layout: false
  else
  	if user
  		session[:user_id] = user.id
  		redirect "/"
  	else
  		@errors = ["Password/email combination is incorrect"]
  		erb :login
    end
	end
end

get '/users/new' do
  erb :'users/new'
end

get '/logout' do
	session.delete(:user_id)
	redirect '/'
end