get '/' do
  redirect '/questions'
end

get '/login' do
  erb :login
end

post '/login' do
  result = User.find_by(username: params[:username])
  user = result.authenticate(params[:password]) if result != nil
  if user != nil
		session[:user_id] = user.id
    if request.xhr?
      erb :'users/_login', locals: {user: user}, layout: false
    else
   	 redirect "/"
    end
	else
    if request.xhr?
      400
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
