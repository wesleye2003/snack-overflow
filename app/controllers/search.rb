get '/search'  do
  @search_item = params[:query]
  @questions = []
  tag = Tag.find_by(tag_name: @search_item)
  q_by_title_body = Question.where("title LIKE '%#{@search_item}%' OR body LIKE '%#{@search_item}%'")
  if tag != nil && q_by_title_body != nil
    tag.questions.each {|item| @questions << item}
    q_by_title_body.each {|item| @questions << item}
  elsif tag != nil
    @questions = tag.questions
  elsif q_by_title_body != nil
      @questions = q_by_title_body
  else
    @questions = []
  end
  erb :'search/results'
end
