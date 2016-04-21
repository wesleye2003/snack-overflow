get '/answers/new' do
	if request.xhr?
		status 200
	else
		status 400
	end
end