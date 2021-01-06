class HeresJohnny
  attr_reader :prompt
  attr_accessor
  # here will be your CLI!
  # it is not an AR class so you need to add attr
def  initialize
@prompt = TTY::Prompt.new
end
       
## create password
## leave review comment
## bathroom average rating
## scrape for real data
## seinfeld fluff
## more fluff
## 


  def run
    welcome
    locate
    login_or_signup
    gotta_go
    in_session
    leave_review
    # wanna_see_favs?
    # get_joke(what_subject)
    puts "Goodbye!"
  end

  def welcome
    puts "Here's Johnny!!! "
    sleep(1)
    puts "So it looks like you really gotta go!"
    sleep(1)
  end

  def login_or_signup
    user = prompt.ask("What is your username?")
    @user = User.find_or_create_by(name: user)
    ## welcome with username
    puts "Welcome #{@user.name}!"
    sleep(0.5)
  end

  # def get_input
  #   #find out why we did this
  #    gets.chomp
  # end

  def main_menu

    ##need to put option if there are no reviews
    prompt.select("Main Menu:") do |menu|

      menu.choice "Find a restroom.",->{locate_user}
      menu.choice "My reviews.",->{check_reviews}
      menu.choice  "Exit.",->{exit}
    end
  end

  def gotta_go
  #options = ["Yes, please find me a restroom." , "No, I would like to see my reviews." , "Nah I'm good."]
    prompt.select("Do you gotta go right now?") do |menu|

      menu.choice "Yes, please find me a restroom.",->{locate_user}
      menu.choice "No, take me to the main menu",->{main_menu}
      menu.choice  "Nah I'm good.",->{trivia}
      end
  end

  def trivia
    #binding.pry
    puts "Here is an interesting fact about toilets that we use everyday."
    sleep(1)
    puts Fact.all.sample.content
    sleep(2)
    main_menu
  end

  def locate_user
    input = prompt.select("where are you right now?", Area.all.pluck(:name), "↩️")
    main_menu if input == "↩️" 
    area = Area.find_by(name: input)
    restrooms = Restroom.where(area_id: area.id).pluck(:address)
    puts "There are available restrooms at the following locations"
    restroom =   prompt.select("Which would you like to visit?", restrooms)
    # get_restroom_instance(restroom)
    @used_restroom = get_restroom_instance(restroom)
    puts "when you gotta go you gotta go! so go!!!"
    in_session
  end

  def in_session  
    4.times do 
      sleep(1)
      puts "💩"
    end
   sleep(1)
   leave_review
  end

  def leave_review
    satisfied = prompt.yes?("Hope you enjoyed, would you like to leave a review?")
    if satisfied 
      review
    else 
  puts "Okay, returning to main menu!"
  sleep(1)
  main_menu
    end
  end

def review
  new_rating = review_helper
  new_review = Review.find_or_create_by(user_id: @user.id, restroom_id: @used_restroom.id)
  new_review.update(rating: new_rating) 
  ##spelling mistake "your"
  puts "Thank you for your feedback!"
  sleep(1)
  main_menu
end

  def check_reviews
    ####need to add a reload method###
    @user.reviews.reload
   
    addy = @user.reviews.map{|x|Restroom.where(id: x.restroom_id).pluck(:address)}.flatten
    rate = @user.reviews.pluck (:rating)
    
    
    listicle = addy.zip rate
    listicle.each{|x|puts"You gave #{x[0]} a rating of  #{x[1]}!"}
    #binding.pry
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

  
    
    # Uses a hash
    # listicle = Hash[addy.zip rate]
    # listicle.each{|k,v| puts "You gave #{k} a rating of #{v}!"}
  end

  def review_helper
    puts "on a scale of 1-5, how would you rate this restroom?"
    #FIX POOP EMOJI
  prompt.slider("stars", min:1, max:5, step:1, symbols:{bullet:"poop emoji", line:"_"}) 
  end

  def update_review
    #binding.pry
    restroom = prompt.select("Please select a review to update", @user.restrooms.pluck(:address), "↩️")
    check_reviews if restroom == "↩️"
  #   if !@user.restrooms.empty?
  # else
  #     puts 
   
    restroom_instance = get_restroom_instance(restroom)
    rating = review_helper
    reviewed = Review.find_by(user_id: @user.id, restroom_id: restroom_instance.id)
    reviewed.update(rating: rating)
    puts "Thank you for your feedback! Your #{restroom} rating has been updated to #{rating}!"
    ### goes to check reviews method when done
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
    restroom_instance = Restroom.find_by(address: restroom)
  end

  # def delete_review
  #   ## added tty for delete
  #   restroom = prompt.select("Please select a review to delete", @user.restrooms.pluck(:address))
  #   ##puts "Which review would you like to delete?"
  #   ##restroom = get_input
  #   restroom_instance = get_restroom_instance(restroom)
  #   reviewed = Review.find_by(user_id: @user.id, restroom_id: restroom_instance.id)
  #   reviewed.destroy
  #   puts "You have successfully destroyed your review!"
  #   ## goes back to check review method

  #   check_reviews

  # end

  def delete_review
    puts 
      restroom = prompt.select("Which review would you like to delete?", @user.restrooms.pluck(:address), "↩️")
      check_reviews if restroom == "↩️"
      # menu = (menu.choice  "Return to Menu",->{main_menu})
      # restroom = get_input
      restroom_instance = get_restroom_instance(restroom)
      reviewed = Review.find_by(user_id: @user.id, restroom_id: restroom_instance.id)
      delete = prompt.yes?("Are you sure you want to delete your review for #{restroom_instance.address}?")
      if delete 
        reviewed.destroy
          sleep(1)
      puts "You have successfully destroyed your review!"
          sleep(1)
     # puts "Returning to main menu."
        check_reviews
      else
        check_reviews
      end
  end

##fixed wrong words line 120 (restaurant to review)
# def locate
#   zipcode = prompt.ask("What zip code are you in?")
#   binding.pry
#   location = $converts[zipcode]
# end

def locate
  location = prompt.collect do
    key(:address).ask("Address?", required: true)
    key(:city).ask("City?", required: true)
    #key(:zip).ask("Zip?", validate: /\A\d{3}\Z/)
  end
  place = location.map{|k,v| "#{v}"}.join(", ")
  map_response = location_request(place)
  geo = convert_to_geo(map_response)
  
  binding.pry
end
  
# result = prompt.collect do
#   key(:name).ask("Name?")

#   key(:age).ask("Age?", convert: :int)

#   key(:address) do
#     key(:street).ask("Street?", required: true)
#     key(:city).ask("City?")
#     key(:zip).ask("Zip?", validate: /\A\d{3}\Z/)
#   end
#end

  private

  
end
