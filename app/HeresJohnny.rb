class HeresJohnny

    attr_reader :prompt
    attr_accessor

  def  initialize
    @prompt = TTY::Prompt.new
  end
      
  def run
    start = Start.new
    start.intro
    welcome
    login_or_signup
    gotta_go
    in_session
    leave_review
      puts "Goodbye!"
  end

  def welcome
    
    puts "You had to have the BIG salad!!!"
      sleep(1)
    puts "My name is George! I am unemployed and I live with my parents."
      sleep(1)
  end

  def login_or_signup
    user = prompt.ask("What is your username?")
    @user = User.find_or_create_by(name: user)
    
    puts "Well #{@user.name}, worlds are now colliding!"
    sleep(0.5)
  end

  def main_menu
    system 'clear'
    prompt.select("Main Menu:") do |menu|
      menu.choice "Find a restroom.",->{locate_user}
      menu.choice "My reviews.",->{check_reviews}
      menu.choice  "Exit.",->{leave}
    end
  end

  def leave
    puts "You're using the it's not you its me?! I invented the it's not you it's me! If it's anybody, it's me!!"
    sleep(2)
    puts "eh, get outa here!"
    exit
  end

  def gotta_go
    prompt.select("You know, i've always been a stall man. Do you gotta go right now?") do |menu|
      menu.choice "Yes, please find me a restroom.",->{locate_user}
      menu.choice "It's the summer of George! Take me to the main menu",->{main_menu}
      menu.choice  "Vandeleigh Industries",->{trivia}
      end
  end

  def trivia
    puts "Here is an interesting fact about toilets."
      sleep(1)
    puts Fact.all.sample.content
      sleep(6)
    main_menu
  end

  def locate_user
      locate
    @used_restroom = get_restroom_instance(@restroom_address)
      puts "If it wasn’t for the toilet, there would be no books."
      sleep(0.5)
      puts "This is not an app about nothing! Go to your bathroom!"
      sleep(3)
    in_session
  end

  def in_session  
    2.times do 
      sleep(1)
    puts "💩💩💩💩💩💩"
  end
  puts "
  -------------------------------------------------------------------------


___   ________________________   ___   ________________________   ___
   I I                        I I   I I                        I I
   I I                        I I   I I                        I I
   IHI   You can't spare      I I   IHI    No! I don't have    I I
   I I   3 squares?           I I   I I    a square to spare   I I
   I I                        I I   I I                        I I
   I I                        I I   I I                        I I
   I I                     O  I-I   I I                     O  I-I
   I I                        I I   I I                        I I
   I I                        I I   I I                        I I
   I I                        I I   I I                        I I
   IHI                        I I   IHI                        I I
   I I                        I I   I I                        I I
___I I________________________I I___I I________________________I I___
 I         (_( )___( )_)          I          (_( )___( )_)         I
 I           I I   I I            I            I I   I I           I
 I           I_I   I_I            I            I I   I I           I
_H_          <$>   <$>           _H_           <#>   <#>          _H_


--
------------------------------------------------------------------------
"
      sleep(9)
    leave_review
  end

  def leave_review
    system 'clear'

    satisfied = prompt.yes?("Welcome back! Now you listen to me. I want details and I want them right now. Are you going to leave a review?")
      if satisfied 
    review
      else 
    puts "Serenity now!!! Returning to main menu!"
      sleep(1)
    main_menu
    end
  end

  def review
      new_rating = review_helper
      if new_rating < 3
        puts "I think, that you think, that a certain something is not all that it could be. When in fact, it is all that it should be... AND MORE"
        sleep(5)
      else
        puts "These reviews are making me thirsty!"
        sleep(4)
      end
    new_review = Review.find_or_create_by(user_id: @user.id, restroom_id: @used_restroom.id)
    new_review.update(rating: new_rating) 
      puts "Thank you for your feedback!"
        sleep(1)
    main_menu
  end

  def check_reviews
    @user.reviews.reload
        addy = @user.reviews.map{|x|Restroom.where(id: x.restroom_id).pluck(:name)}.flatten
        rate = @user.reviews.pluck (:rating)
      listicle = addy.zip rate
      listicle.each{|x|puts"You gave #{x[0]} a rating of  #{x[1]}!"}
      if @user.reviews.empty?
    puts "You have no reviews" 
        sleep(1) 
    trivia
      end
    prompt.select("Reviews:")  do |menu|
      menu.choice "Update Review",->{update_review}
      menu.choice "Delete Review",->{delete_review}
      menu.choice  "↩️",->{main_menu}
    end
  end

  def review_helper
    puts "on a scale of 1-5, how would you rate this restroom? And remember, it's not a lie if you believe it."
    #FIX POOP EMOJI
    prompt.slider("stars", min:1, max:5, step:1, symbols:{bullet:"🥨", line:"_"}) 
  end

  def update_review
        restroom = prompt.select("The sea was angery that day... Please select a review to update", @user.restrooms.pluck(:name), "↩️")
    check_reviews if restroom == "↩️"
      restroom_instance = Restroom.find_by(name: restroom)
        rating = review_helper
      reviewed = Review.find_by(user_id: @user.id, restroom_id: restroom_instance.id)
      reviewed.update(rating: rating)
    puts "Yada Yada Yada #{restroom} rating has been updated to #{rating}!"
      check_reviews
        delete = prompt.yes?("Would you like to delete a review?")
    if delete 
      delete_review
    else 
    puts "Okay, returning to main menu!"
        sleep(1)
      main_menu
    end
  end

  def get_restroom_instance(restroom)
    restroom_instance = Restroom.find_by(address: restroom[:value])
  end

  def delete_review
    puts 
      restroom = prompt.select("I don't want to be remembered, i want to be forgotten. Which review would you like to delete?", @user.restrooms.pluck(:name), "↩️")
    check_reviews if restroom == "↩️"
      restroom_instance = Restroom.find_by(name: restroom)
    reviewed = Review.find_by(user_id: @user.id, restroom_id: restroom_instance.id)
    delete = prompt.yes?("Are you sure you want to delete your review for #{restroom_instance.name}?")
      if delete 
        reviewed.destroy
          sleep(1)
      puts "You have successfully destroyed your review! Just like my relationships!"
          sleep(1)
        check_reviews
      else
        check_reviews
      end
  end

  def locate 
    location = prompt.collect do
      key(:address).ask("What is your current address?") do |q|
        q.required true
        q.validate(/\A\w|\s\Z/, "Please enter a valid street address")
  end
      key(:city).ask("In which city?") do |q|
        q.required true 
        q.validate(/\A[a-z]|\s\Z/, "Please enter a valid city")
  end
  end
    place = location.map{|k,v| "#{v}"}.join(", ")
  map_response = location_request(place)
    geo = convert_to_geo(map_response)
  url = "http://www.refugerestrooms.org/api/v1/restrooms/by_location?page=1&per_page=5&lat=#{geo[:lat]}&lng=#{geo[:lng]}"
      response = RestClient.get(url)
      body = response.body
      parsed = JSON.parse(body)
    bathrooms = []
  nearby_rr = parsed.map{|x| Restroom.find_or_create_by(name: x["name"], address: x["street"])}
  places = nearby_rr.map{|x| "#{x.name} located at #{x.address}" }
    hash = {}
  nearby_rr.map{|x| hash[x.name] = x.address }
    @restroom_address = prompt.select("There are bathrooms at the following locations") do |m|
  hash.each{|k,v| m.choice "#{k} located at #{v}", value: v}
  end
end
  


  private

  
end
