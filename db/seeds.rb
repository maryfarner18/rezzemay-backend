# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

WorkExperience.destroy_all()
Skill.destroy_all()
Education.destroy_all()
Address.destroy_all()
Website.destroy_all()
Project.destroy_all()
User.destroy_all()

mary = User.create(first_name: "Mary", last_name: "Farner", username: "maryfarner", password: "password", phone: "2692671103", email:"maryfarner@gmail.com")

Education.create(user: mary, university: "Yale", degree:"BS", concentration: "Computer Science & Math", start:"2012", end:"2016")
Education.create(user: mary, university: "Flatiron", degree:"N/A", concentration: "Software Development", start:"2019", end:"2020")

Address.create(user: mary, street1: "260 Washington Ave", street2: "Apt D2", city: "Brook;yn", state: "NY", zip:"11205", country:"United States")

Project.create(user: mary, title: "Title 1", description: "blah blah blah ONE", link:"here's 1 link", image:"here's 1 image")
Project.create(user: mary, title: "Title 2", description: "blah blah blah", link:"here's a link", image:"here's an image")

Skill.create(user: mary, name: "Javascript", proficiency: "Expert")
Skill.create(user: mary, name: "Ruby", proficiency: "Advanced")

Website.create(user: mary, link: "")
Website.create(user: mary, link: "")
Website.create(user: mary, link: "")

WorkExperience.create(user: mary, company: "US Air Force", title: "Computer Scientist", start: "2016", end: "2017", city: "Rome", state:"NY", description: "It sucked")
WorkExperience.create(user: mary, company: "Bank of America Merrill Lynch", title: "Trader", start: "2017", end: "2018", city: "New York", state:"NY", description: "It sucked more")