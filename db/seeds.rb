# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Test.create(title: "Hello world!", level: 1)
Test.create(title: "Off to a fresh start.", level: 1)
Test.create(title: "Lets get to business", level: 2)
Test.create(title: "How and why", level: 3)
Test.create(title: "Really complicated stuff", level: 5)

Question.create(test_id: 1, body: "How to hello world?")
Question.create(test_id: 1, body: "How to create a variable?")
Question.create(test_id: 2, body: "Choose the right sequence")
Question.create(test_id: 2, body: "What is wrong with this array?")
Question.create(test_id: 5, body: "What should you do to become a better programmer?")

Answer.create(question_id: 1, body: "puts Hello World", correct: true)
Answer.create(question_id: 1, body: "Something different", correct: false)
Answer.create(question_id: 1, body: "etc", correct: false)
Answer.create(question_id: 2, body: "correct answer", correct: true)
Answer.create(question_id: 2, body: "not", correct: false)

User.create(username: "CepCap", password: "Secret123", level: 0)
User.create(username: "Soloma", password: "qwerty", level: 1)
User.create(username: "Avaak", password: 12345, level: 1)
User.create(username: "Edi", password: 54321, level: 1)
User.create(username: "Kani", password: "easy_password", level: 1)

Category.create(title: "CSS", level: 1)
Category.create(title: "PHP", level: 1)
Category.create(title: "C++", level: 2)
Category.create(title: "Unity", level: 2)
Category.create(title: "Hard and complicated stuff", level: 5)
