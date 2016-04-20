get '/' do
  erb :welcome
end

get '/login' do
  
end

get '/signup' do
  
end

get '/logout' do
	session[:user_id].delete
end