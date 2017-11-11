# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

@user = User.create(email: "test@test.com", password: "password", password_confirmation: "password", first_name: "Don", last_name: "Johnson")

10.times do |post|
  Post.create!(title: "Some title", content: "Some Content asdfasdf", date: Date.today)
end

puts "10 Posts have been created"

100.times do |kontoumsaetze|
  Kontoumsaetze.create(weg: 3, wertstellung: "08.08.2017", umsatzart: "Gutschrift", buchungsdetails: "Referenz 9562231945DI", auftraggeber: "ANNEGRET", empfaenger: "Klaus-Dieter", betrag: 100.20, saldo: 12000.80)
end

puts "100 Kontoumsaetze have been created"