class Player
  attr_reader :name, :score

  def initialize(name)
    @name = name
    @score = 0
    # ability to come later!
  end

  def add_score(value)
    @score += value
  end
end
