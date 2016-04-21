get '/' do
  redirect '/questions'
end

get '/login' do
  erb :login
end

post '/login' do
  p params[:username]
  user = User.find_by(username: params[:username])
  user = user.authenticate(params[:password]) if user
  if user
		session[:user_id] = user.id
    if request.xhr?
      erb :'users/_login', locals: {user: user}, layout: false
    else
   	 redirect "/"
    end
	else
		@errors = ["Password/email combination is incorrect"]
		erb :login
  end
end

get '/users/new' do
  erb :'users/new'
end

get '/logout' do
	session.delete(:user_id)
	redirect '/'
end
