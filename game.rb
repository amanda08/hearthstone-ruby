#!/usr/local/bin/ruby
require './card'

class Game
  attr_reader :card_a, :card_b
  def initialize (card_a, card_b)
    @card_a = card_a
    @card_b = card_b
    puts "#{@card_a.stats} vs #{@card_b.stats}"
  end

  def play
    puts "Let's play!"
    @card_a.take_damage(@card_b.attack)
    @card_b.take_damage(@card_a.attack)
    puts @card_a.status
    puts @card_b.status
  end 

end


# Now using the above class to create two sample cards
reckless_rocketeer = Card.new("Reckless Rocketeer",2,6)
elven_archer = Card.new("Elven Archer",1,1)

game = Game.new(reckless_rocketeer, elven_archer)
game.play