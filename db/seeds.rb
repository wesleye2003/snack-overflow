require 'faker'
User.destroy_all
Question.destroy_all
Answer.destroy_all
Tag.destroy_all
Tagging.destroy_all
Vote.destroy_all
Response.destroy_all

5.times do
  a = User.new(username: Faker::Internet.user_name)
   a.password = "password"
   a.save
end

b = User.new(username: "123")
b.password = "password"
b.save

users_ids=User.all.pluck(:id)

10.times do
  Question.find_or_create_by(title: Faker::StarWars.quote,
    body: Faker::Hipster.paragraph,
    user_id: users_ids.sample)
end

question_ids = Question.all.pluck(:id)
questions = Question.all.to_a

100.times do
  Answer.find_or_create_by(body: Faker::Hacker.say_something_smart,
    user_id: users_ids.sample,
    question_id: question_ids.sample)
end

answers = Answer.all.to_a

25.times do
  Tag.find_or_create_by(tag_name: Faker::Team.creature)
end

tag_ids = Tag.all.pluck(:id)

question_ids.each do |x|
  Tagging.find_or_create_by(tag_id: tag_ids.sample, question_id: x)
end

25.times do
  Response.find_or_create_by(body: Faker::Hacker.say_something_smart, user_id: users_ids.sample, respondable: questions.sample)
  Response.find_or_create_by(body: Faker::Hacker.say_something_smart, user_id: users_ids.sample, respondable: answers.sample)
end
responses = Response.all.to_a

200.times do
  Vote.find_or_create_by(user_id: users_ids.sample, votable: questions.sample, value: 1)
  Vote.find_or_create_by(user_id: users_ids.sample, votable: answers.sample, value: 1)
  Vote.find_or_create_by(user_id: users_ids.sample, votable: responses.sample, value: 1)
end


