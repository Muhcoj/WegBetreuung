# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

@user = User.create(email: "test@test.com", password: "password", password_confirmation: "password", first_name: "Don", last_name: "Johnson")

puts "1 User created"

10.times do |post|
  Post.create!(title: "Some title", content: "Lorem ipsum dolor amet 8-bit meh church-key, actually twee salvia messenger bag swag YOLO bushwick pok pok ennui. Four dollar toast readymade chambray, yuccie tote bag scenester aesthetic art party gentrify lo-fi literally small batch kickstarter fam. Snackwave vinyl cray next level keytar twee raw denim vegan everyday carry. Health goth fashion axe portland lyft small batch trust fund messenger bag cold-pressed flexitarian flannel edison bulb man bun hell of single-origin coffee man braid. Meditation post-ironic cray fanny pack, venmo hot chicken dreamcatcher godard occupy ugh church-key lomo tattooed. Seitan gluten-free vice palo santo yr, small batch retro cloud bread swag organic pour-over keytar truffaut subway tile pork belly. Asymmetrical viral fashion axe green juice franzen, chicharrones tumblr austin forage air plant pickled bespoke fam pop-up.", date: Date.today)
end

puts "10 Posts have been created"

100.times do |kontoumsaetze|
  Kontoumsaetze.create(weg: 3, wertstellung: "08.08.2017", umsatzart: "Gutschrift", buchungsdetails: "Referenz 9562231945DI", auftraggeber: "ANNEGRET", empfaenger: "Klaus-Dieter", betrag: 100.22, saldo: 12000.87, user_id: @user.id)
end

puts "100 Kontoumsaetze have been created"