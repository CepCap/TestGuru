# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

categories = Category.create([{ title: "CSS" },
                            { title: "PHP" },
                            { title: "C++" },
                            { title: "Unity" },
                            { title: "Hard and complicated stuff" }])

users = User.create([{ email: 'test@gmail.com' },
                     { email: 'test1@gmail.com' },
                     { email: 'tes@gmail.com' },
                     { email: 'te@gmail.com' },
                     { email: 't@gmail.com' }])

tests = Test.create([{ title: "Hello world!", category: categories[0], level: 1, author: users[0]},
                     { title: "Off to a fresh start.", category: categories[1], level: 2, author: users[0] },
                     { title: "Lets get to business", category: categories[2], level: 3, author: users[1] },
                     { title: "How and why", category: categories[2], level: 4, author: users[1] },
                     { title: "Really complicated stuff", category: categories[3], level: 5, author: users[1] }])

questions = []

tests.each do |test|
  3.times do
    questions << Question.create(body: "Generic question", test: test)
  end
end

questions.each do |question|
    Answer.create(body: "Correct", correct: true, question: question)
    Answer.create(body: "Wrong", correct: false, question: question)
end
