class Player
  attr_reader :name, :score

  def initialize(name)
    @name = colorize(name)
    @score = 0
    # @hand
    # @current_card
    # ability to come later!
  end

  def add_score(value)
    @score += value
  end

  def colorize(name)
    "\e[01;#{rand(30..36)}m" + name + "\e[0m"
  end

  # def take_turn (select card)

end
