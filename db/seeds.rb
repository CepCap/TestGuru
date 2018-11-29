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

users = User.create([{ name: "CepCap", email: 'test1@gmail.com' }, 
                     { name: "Soloma", email: 'test1@gmail.com' }, 
                     { name: "Avaak", email: 'test1@gmail.com' }, 
                     { name: "Edi", email: 'test1@gmail.com' }, 
                     { name: "Kani", email: 'test1@gmail.com' }])

tests = Test.create([{ title: "Hello world!", category: categories[0], level: 1, author: users[0]},
                     { title: "Off to a fresh start.", category: categories[1], level: 2, author: users[0] },
                     { title: "Lets get to business", category: categories[2], level: 3, author: users[1] },
                     { title: "How and why", category: categories[2], level: 4, author: users[1] },
                     { title: "Really complicated stuff", category: categories[3], level: 5, author: users[1] }])

questions = Question.create([{ body: "How to hello world?", test: tests[0] },
                             { body: "How to create a variable?", test: tests[1] },
                             { body: "Choose the right sequence", test: tests[2] },
                             { body: "What is wrong with this array?", test: tests[2] },
                             { body: "What should you do to become a better programmer?", test: tests[5] }])

answers = Answer.create([{ body: "puts Hello World", correct: true, question: questions[0] },
                         { body: "Something different", correct: false, question: questions[0] },
                         { body: "etc", correct: true, question: questions[1] },
                         { body: "correct answer", correct: true, question: questions[1] },
                         { body: "not", correct: false, question: questions[4] }])
