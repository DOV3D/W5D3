# PHASE 2

class CoffeeError

end 

class FruitError 

end 

def convert_to_int(str)
  begin 
    Integer(str)
  rescue ArgumentError
    puts "Please enter the value as an integer. eg) 5 instead of five"
    convert_to_int(gets.chomp)
  end 
end

# PHASE 3
FRUITS = ["apple", "banana", "orange"]

def reaction(maybe_fruit)
  if FRUITS.include? maybe_fruit
    puts "OMG, thanks so much for the #{maybe_fruit}!"
  else 
    #if maybe_fruit == "coffee"
    raise StandardError.new ("#{maybe_fruit} isn't a fruit. What else do you have for me?") 
    #end 
  end 
end

def feed_me_a_fruit
  puts "Hello, I am a friendly monster. :)"

  puts "Feed me a fruit! (Enter the name of a fruit:)"
  maybe_fruit = gets.chomp
  begin 
    reaction(maybe_fruit)
  rescue StandardError => e 
    puts e.message
    maybe_fruit = gets.chomp
    if maybe_fruit != "coffee"
      wrong_attempt = true 
    end 
  
    if wrong_attempt
      raise "Sorry, you have no more tries left :("
    end 
    
    retry 
  end 
  
  
end  

# PHASE 4

class YearsError < StandardError 

end 

class BestFriend
  def initialize(name, yrs_known, fav_pastime)
    @name = name
    begin 
      @yrs_known = yrs_known
    rescue YearsError => e
      puts e.message
    end 
    
    @fav_pastime = fav_pastime

  end

  def years_error

  end 

  def talk_about_friendship
    puts "Wowza, we've been friends for #{@yrs_known}. Let's be friends for another #{1000 * @yrs_known}."
  end

  def do_friendstuff
    puts "Hey bestie, let's go #{@fav_pastime}. Wait, why don't you choose. 😄"
  end

  def give_friendship_bracelet
    puts "Hey bestie, I made you a friendship bracelet. It says my name, #{@name}, so you never forget me." 
  end
end


