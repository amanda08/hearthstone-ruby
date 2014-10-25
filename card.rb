#!/usr/local/bin/ruby

class Card
  attr_reader :name, :health, :attack
  def initialize (name, health, attack)
    @name = name
    @health = health
    @attack = attack
  end

  def take_damage (value)
    @health -= value
  end

  def status 
    if @health > 0 
      "#{@name}'s health = #{@health}"
    else 
      "#{@name} is DEAD!"
    end
  end

  def is_alive?
    @health > 0 ? true : false
  end

  def stats
    "#{@name} (#{@attack}, #{@health})"
  end
end

sylvanas = Card.new("Sylvanas", 5, 5)
puts sylvanas.stats
puts "Takes 2 damage!"
sylvanas.take_damage(2)
puts sylvanas.stats


puts "Hello Hearthstone!"

