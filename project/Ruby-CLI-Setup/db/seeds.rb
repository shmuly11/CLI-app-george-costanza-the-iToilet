Area.destroy_all
Review.destroy_all
Restroom.destroy_all
User.destroy_all
Area.reset_pk_sequence
Review.reset_pk_sequence
Restroom.reset_pk_sequence
User.reset_pk_sequence
Fact.destroy_all
Fact.reset_pk_sequence

########### different ways to write your seeds ############

joe = User.create(name: "Joe")
jeff = User.create(name: "Jeff")
jack = User.create(name: "Jack")

brooklyn = Area.create(name: "Brooklyn")
long_island = Area.create(name: "Long Island")
bronx = Area.create(name: "Bronx")
queens = Area.create(name: "Queens")

starbucks = Restroom.create(area_id: 1, address: "Starbucks", free: true)
macys = Restroom.create(area_id: 2, address: "Macys", free: true)
nike = Restroom.create(area_id: 3, address: "Nike", free: true)
cvs = Restroom.create(area_id: 2, address: "CVS", free: true)
brooklyn_public_library = Restroom.create(area_id: 1, address: "Brooklyn Public Library", free: true)
zara = Restroom.create(area_id: 2, address: "Zara", free: true)
chipotle = Restroom.create(area_id: 4, address: "Chipotle", free: true)
dunkin = Restroom.create(area_id: 4, address: "Dunkin", free: true)

Review.create(user_id: 1, restroom_id: 1, rating: 4)
Review.create(user_id: 2, restroom_id: 2, rating: 5)
Review.create(user_id: 3, restroom_id: 3, rating: 5)
Review.create(user_id: 4, restroom_id: 4, rating: 3)
Review.create(user_id: 1, restroom_id: 5, rating: 1)
Review.create(user_id: 3, restroom_id: 6, rating: 3)
Review.create(user_id: 2, restroom_id: 7, rating: 2)
Review.create(user_id: 1, restroom_id: 8, rating: 4)
Review.create(user_id: 4, restroom_id: 3, rating: 4)
Review.create(user_id: 3, restroom_id: 5, rating: 5)
Review.create(user_id: 1, restroom_id: 7, rating: 1)

$scraped_trivia = []
TriviaScraper.crawl!
$scraped_trivia.flatten.each do |fact|
    Fact.create(content: fact.text)
end

2.times do
    Fact.first.destroy
end
Fact.last.destroy
Fact.reset_pk_sequence

puts "🔥 🔥 🔥 🔥 Seeds Created!!! 🔥 🔥 🔥 🔥"