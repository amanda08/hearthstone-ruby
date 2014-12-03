class Card
  attr_reader :name, :health, :attack

  def initialize (args)
    @name = args["name"]
    @health = args["health"].to_i # converts nil values to 0
    @attack = args["attack"].to_i # converts nil values to 0
    @args = args
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

  def ascii_color
    @args["ascii_colorcode"] || 32
  end

  def ascii?
    @args.has_key?("ascii_filename")
  end

  def ascii_filename
    @args["ascii_filename"]
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

