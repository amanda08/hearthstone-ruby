require_relative './deck'
require_relative './player'
require_relative './ascii_output'

class Game
  attr_accessor :deck
  def initialize
    puts "Enter the first player's name:"
    @player1 = Player.new(gets.chomp)
    puts "Enter the second player's name:"
    @player2 = Player.new(gets.chomp)
    @deck = Deck.new
  end

  def play
    while true
      puts "New match!"
      # players_draw_cards?
      @card_a = @deck.deal_card
      @card_b = @deck.deal_card
      pause_for_effect
      puts @player1.name + ": "
      display_card(@card_a)
      puts @player2.name + ": "
      display_card(@card_b)
      battle
      add_score
      puts @player1.name + ": " + @player1.score.to_s
      puts @player2.name + ": " + @player2.score.to_s
      break if @deck.count < 2
      puts "Press ENTER to draw again."
      gets
    end
    outcome
  end

  def match
    
  end

  def battle
    while @card_a.is_alive? && @card_b.is_alive? do
      display_message("battle")
      @card_a.take_damage(@card_b.attack)
      @card_b.take_damage(@card_a.attack)
      puts @card_a.status
      puts @card_b.status
      if @card_a.attack == 0 && @card_b.attack == 0 
        scrum
      end
    end
  end 

  def add_score
    @player1.add_score(@card_a.health) if @card_a.is_alive?
    @player2.add_score(@card_b.health) if @card_b.is_alive?
  end

  def pause_for_effect
    4.times do 
      print "."
      sleep(0.1)
    end
    puts
  end

  def scrum
    puts "Both players are too weak - it's Scrum time!"
    display_message("scrum")
    pause_for_effect
    num = rand(2)
    temp_deck = Deck.new
    if num == 1 
      puts "#{@player1.name} survives. #{@player2.name} redraw! "
      @card_b = temp_deck.deal_card
      puts "#{@player2.name} draws #{@card_b.name}."
    else
      puts "#{@player2.name} survives. #{@player1.name} redraw! "
      @card_a = temp_deck.deal_card
      puts "#{@player1.name} draws #{@card_a.name}."
    end
  end

  def display_card(card)
    if card.ascii?
      display_ascii_by_line(card.ascii_filename,card.ascii_color)
      puts card.stats
    else
      puts card.stats
    end
  end

  def display_message(string)
    case string
    when "scrum"
      display_ascii_by_line("sword.txt", 32)
    when "winner"
      display_ascii_by_line("winner.txt", 35)
    when "fireworks"
      display_ascii_by_line("fireworks.txt", 36)
    when "battle"
      print "\e[01;33m"
      print "Time to battle!"
      3.times { print "." ; sleep(0.1) }
      puts "\e[0m"
    else 
      puts "message #{string} not found"
    end  
  end

  def display_ascii_by_line(filename, colorcode)
    print "\e[01;#{colorcode}m"
    File.open("data/"+filename).each do |line|
      print "#{line}"
      sleep(0.1)
    end
    puts "\e[0m"
  end

  def outcome
    if @player1.score > @player2.score
      puts "#{@player1.name} is the winner!"
      display_message("winner")
    elsif @player1.score == @player2.score
      puts "It's a draw!" 
    else
      puts "#{@player2.name} is the winner!"
      display_message("fireworks")
    end
  end
end


# Now using the above class to create two sample cards
# reckless_rocketeer = Card.new("Reckless Rocketeer",2,6)
# elven_archer = Card.new("Elven Archer",1,1)

# game = Game.new(reckless_rocketeer, elven_archer)
# game.play

# How can I generate a random game based on a list of cards?
# Should I randomize the attack and health values? Or keep them linked to the cards?
# Let's create a list of hash objects that contain card values, grab two of those values and turn them into card objects.
