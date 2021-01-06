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


# 1: save everything to variables (makes it easy to connect models, best for when you want to be intentional about your seeds)


# 2. Mass create -- in order to connect them later IN SEEDS (not through the app) you'll need to find their id
## a. by passing an array of hashes:







# Plant.create([
#     {name: "Corn Tree", bought: 20170203, color: "green"},
#     {name: "Prayer plant", bought: 20190815, color: "purple"},
#     {name: "Cactus", bought: 20200110, color: "ugly green"}
# ])
# ## b. by interating over an array of hashes:
# plants = [{name: "Elephant bush", bought: 20180908, color: "green"},
#     {name: "Photos", bought: 20170910, color: "green"},
#     {name: "Dragon tree", bought: 20170910, color: "green"},
#     {name: "Snake plant", bought: 20170910, color: "dark green"},
#     {name: "polka dot plant", bought: 20170915, color: "pink and green"},
#     {name: "Cactus", bought: 20200517, color: "green"}]

# plants.each{|hash| Plant.create(hash)}






# 3. Use Faker and mass create
## step 1: write a method that creates a person
# def create_person
#     free = ["mornings", "evenings", "always", "afternoons", "weekends", "none"].sample

#     person = Person.create(
#         name: Faker::Movies::HitchhikersGuideToTheGalaxy.character,
#         free_time: free,
#         age: rand(11...70)
#     )
# end

# ## step 2: write a method that creates a joiner
# def create_joiners(person)
#     plants_number = rand(1..4)
#     plants_number.times do 
#         PlantParenthood.create(
#             plant_id: Plant.all.sample.id, 
#             person_id: person.id, 
#             affection: rand(101), 
#             favorite?: [true, false].sample
#         )
#     end
# end

# ## step 3: invoke creating joiners by passing in an instance of a person
# 10.times do     
#     create_joiners(create_person)
#     ##### ALTERNATIVE:
#     # person = create_person
#     # create_joiners(person)
# end

# indoor = Category.create(name: "indoors")

# Plant.update(category_id: indoor.id)


puts "🔥 🔥 🔥 🔥 Seeds Created!!! 🔥 🔥 🔥 🔥"