class BowlingGame
  attr_reader :score
  def pin(rolls)
    @score = rolls.inject(:+)
  end

end
