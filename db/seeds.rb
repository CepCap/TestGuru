# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

category = Category.create([{title: "CSS"}, {title: "PHP"}, {title: "C++"}, {title: "Unity"}, {title: "Hard and complicated stuff"}])

users = User.create([{name: "CepCap"}, {name: "Soloma"}, {name: "Avaak"}, {name: "Edi"}, {name: "Kani"}])

Test.create(title: "Hello world!", category_id: 1, level: 1)
Test.create(title: "Off to a fresh start.", category_id: 1, level: 2)
Test.create(title: "Lets get to business", category_id: 2, level: 3)
Test.create(title: "How and why", category_id: 2, level: 4)
Test.create(title: "Really complicated stuff", category_id: 3, level: 5)

Question.create(body: "How to hello world?", test_id: 1)
Question.create(body: "How to create a variable?", test_id: 1)
Question.create(body: "Choose the right sequence", test_id: 2)
Question.create(body: "What is wrong with this array?", test_id: 2)
Question.create(body: "What should you do to become a better programmer?", test_id: 5)

Answer.create(body: "puts Hello World", correct: true, question_id: 1)
Answer.create(body: "Something different", correct: false, question_id: 1)
Answer.create(body: "etc", correct: false, question_id: 2)
Answer.create(body: "correct answer", correct: true, question_id: 2)
Answer.create(body: "not", correct: false, question_id: 5)

