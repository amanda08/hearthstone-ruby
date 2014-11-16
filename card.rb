#!/usr/local/bin/ruby

class Card
  attr_accessor :name, :health, :attack
  def initialize (name, health, attack)
    @name = name
    @health = health.to_i
    @attack = attack.to_i
  end

  def take_damage (value)
    @health -= value
  end

  def status 
    if is_alive?
      "#{@name}'s health = #{@health}"
    else 
      "#{@name} is DEAD!"
    end
  end

  def is_alive?
    @health > 0
  end

  def stats
    "#{@name} (#{@attack}, #{@health})"
  end
end

# sylvanas = Card.new("Sylvanas", 5, 5)
# puts sylvanas.stats
# puts "Takes 2 damage!"
# sylvanas.take_damage(2)
# puts sylvanas.stats


# puts "Hello Hearthstone!"

