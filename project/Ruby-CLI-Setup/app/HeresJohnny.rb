class HeresJohnny
  # here will be your CLI!
  # it is not an AR class so you need to add attr

  def run
     welcome
    login_or_signup
    gotta_go
    # wanna_see_favs?
    # get_joke(what_subject)
  end

  def welcome
    puts "Here's Johnny!!! "
    sleep(1)
    puts "So it looks like you really gotta go!"
    sleep(1)
  end

  def login_or_signup
    puts "What is your username?"
    user = get_input
    @user = User.find_or_create_by(name: user)
    
  end

  def get_input
    #find out why we did this
     gets.chomp
  end

  def gotta_go
    puts "Do you gotta go right now?"
    input = get_input
    
      if input == "yes"
        locate_user
      elsif input == "no"
        check_reviews
      else
        puts "please answer yes or no"
        gotta_go
      end
  end

  def locate_user
    puts "where are you right now?"
    puts Area.all.pluck(:name)
    input = get_input
    area = Area.find_by(name: input)
    #binding.pry
    restrooms = Restroom.where(area_id: area.id).pluck(:address)
    #add rating to restroom output
    puts "There are available restrooms at the following locations"
    sleep(1)
    puts restrooms
    puts "Which would you like to visit?"
    restroom = get_input
    # binding.pry
    @used_restroom = Restroom.find_by(address: restroom)
    puts "when you gotta go you gotta go! so go!!!"
    4.times do 
      sleep(1)
      puts "💩"
    end
  
    sleep(1)
    puts "Hope you enjoyed, what would you like to do next?"
    sleep(1)
    puts "leave a review?(1)"
    sleep(1)
    puts "check out your reviews?(2)"
    sleep(1)
    puts "exit?(3)"
    input = get_input
    if input == "1"
      puts "1"
      review
    elsif input == "2"
      puts "2"
      check_reviews
    elsif input == "3"
      puts "3"
      exit!
    end

  end

  def review
  puts "on a scale of 1-5, how would you rate this restroom?"
  new_rating = get_input.to_i
  # binding.pry
  Review.create(user_id: @user.id, restroom_id: @used_restroom.id, rating: new_rating) 
  puts "Thank you for you're feedback!"
  puts "Would you like to see all of your reviews?"
  input = get_input
  if input == "yes"
    check_reviews
    else 
      puts "Goodbye!!"
      exit!
  end
end

  def check_reviews
    pp @user.reviews

  end


  private

  
end
