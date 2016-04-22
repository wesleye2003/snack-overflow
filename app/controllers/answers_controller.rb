post '/questions/:id/responses/new' do
  if request.xhr? and current_user and params[:comment] != ""
    new_response = Response.create(body: params[:comment], user_id: current_user.id, respondable: Question.find(params[:id]))
    erb :'questions/_response', locals: {response: new_response}, layout: false
  else
    if request.xhr?
      status 400
    else
      redirect "/questions/#{param[:id]}"
    end
  end
end

get '/answers/new' do
  if request.xhr?
    status 200
  else
    status 400
  end
end

post '/answers/:id/responses/new' do
  if request.xhr? and current_user and params[:comment] != ""
    new_response = Response.create(body: params[:comment], user_id: current_user.id, respondable: Answer.find(params[:id]))
    erb :'questions/_response', locals: {response: new_response}, layout: false
  else
    if request.xhr?
      status 400
    else
      question = Answer.find(params[:id]).question.id
      redirect "/questions/#{question}"
    end
  end

end

