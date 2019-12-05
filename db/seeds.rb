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

liam = User.create(first_name: "Liam", last_name: "Healy", user_slug: 'liam-healy', password: "password", password_confirmation: "password", phone: "1234567890", email:"liamhealy@gmail.com")

Education.create(user: liam, university: "Marist College", degree:"BS", concentration: "Computer Science", start:"2015", end:"2019")
Education.create(user: liam, university: "Flatiron", degree:"N/A", concentration: "Software Development", start:"2019", end:"2020")

Address.create(user: liam, street1: "34 E. Lewis St.", street2: "", city: "Pearl River", state: "NY", zip:"10965", country:"United States")

Project.create(user: liam, title: "Website Generator", description: "Helps you generate a website", link:"http://www.github.com")
Project.create(user: liam, title: "GroupIt", description: "Join groups with your friends", link:"http://www.github.com")

Skill.create(user: liam, name: "Googling Stuff", proficiency: "Expert")
Skill.create(user: liam, name: "Ruby", proficiency: "Advanced")
Skill.create(user: liam, name: "Reading Stack Overflow Answers", proficiency: "Advanced")

Website.create(user: liam, link: "http://www.medium.com")
Website.create(user: liam, link: "http://www.github.com")
Website.create(user: liam, link: "http://www.linkedin.com")

WorkExperience.create(user: liam, company: "Marist College IT", title: "Telecommunications Technician", start: "2017", end: "2019", city: "Poughkeepsie", state:"NY", description: "Read help tickets and then don't do anything")
WorkExperience.create(user: liam, company: "Southern Westchester BOCES", title: "Systems Administration Assistant", start: "2017", end: "2019", city: "Rye Brook", state:"NY", description: "Walk around and act like you're really busy")

u1 = User.create(
  first_name: "Turcan",
  last_name: "Cicek",
  user_slug: "turcan-cicek",
  password: "password",
  phone: "646-509-4269",
  email: "hcicek2811@gmail.com",
)

Education.create(user: u1, university: "CUNY Hunter College", degree: "Chemistry", concentration: "Inorganic and Radiochemistry", start: "2012", end: "2016")

Address.create(user: u1, street1: "34-45 87th Street", street2: "", city: "Jackson Heights", state: "NY", zip: "11372", country: "United States")

Project.create(user: u1, title: "Basic", description: "Find that perfect PSL, with Basic!", link:"https://www.https://github.com/HTCicek/Basic-PSL")
Project.create(user: u1, title: "SpeechLister", description: "List things with your VOICE!", link:"https://github.com/HTCicek/SpeechLister-Frontend")

Skill.create(user: u1, name: "Ruby", proficiency: "Baller")
Skill.create(user: u1, name: "Javascript", proficiency: "real-god")
Skill.create(user: u1, name: "Functional Programming", proficiency: "Intermediate")

Website.create(user: u1, link: "https://github.com/HTCicek")
Website.create(user: u1, link: "https://medium.com/@hcicek2811")

WorkExperience.create(user: u1, company: "VCU Center for Molecular Imaging", title: "Radiochemist", start: "2016", end: "2018", city: "Richmond", state: "VA", description: "Managed a radiochemistry laboratory, designed experiments, produced medically-relevant isotopes")
WorkExperience.create(user: u1, company: "Brookhaven National Laboratory", title: "Research Fellow", start: "2016", end: "2016", city: "Upton", state: "NY", description: "Designed a new separation scheme for Actinium-225")
