# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

USER = [["monkey","banana"],["panda","bamboo"]]

USER.each do |user|
  User.create(username: user[0], password: user[1])
end

Survey.create(title: "Favorite food", description: "We want to know what's your favorite food.", author_id: 1)

QUESTIONS = [["Your favorite seafood","sushi, lobster,shellfish"],["Your favorite dessert", "ice cream, cookies, cake, pudding, donut"]]
QUESTIONS.each do |q|
  Question.create(name: q[0], possible_values: q[1], survey_id: 1)
end

Response.create(question_id: 1, content: "sushi")

TakenSurvey.create(survey_id: 1, taker_id: 2)
