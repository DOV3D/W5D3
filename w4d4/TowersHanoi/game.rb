
$first_tower = [1,2,3,4,5,6]
$mid_tower = Array.new(6){" "}
$last_tower = Array.new(6){" "}


def prompt_user
  puts "1. First Tower"
  puts "2. Second Tower"
  puts "3. Third Tower"
  print "Enter a number (q to exit):"
  input = gets.chomp
  input.split(//).include?("q") ? false : input.to_i
end

def print_game
  system("clear")
  rows = $first_tower.zip($mid_tower, $last_tower)
  rows.each do |first, mid, last|
    puts "#{first}".center(10, " ") + "#{mid}".center(10, " ") + "#{last}".center(10, " ")
  end
  puts "first".center(10, " ") + "mid".center(10, " ") + "last".center(10, " ") + "\n"
end

def move
  puts "From which tower would you like to pull?"
  from = prompt_user
  return false unless from.kind_of?(Integer)
  puts
  puts "Where would you like to place it?"
  to = prompt_user
  return false unless to.kind_of?(Integer)
  [from, to]
end

def game
  print_game
  input = 0
  towers = { 1 => $first_tower, 2 => $mid_tower, 3 => $last_tower }
  while (input = prompt_user)
    from, to = input
    towers[to] << towers[from].shift
    print_game
  end
end

game