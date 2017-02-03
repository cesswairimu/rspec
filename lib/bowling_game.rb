class BowlingGame
  def pin(rolls)
    @rolls = rolls
  end

  def score
    frame = 0
    score = 0
    first_in_frame = 0

    while frame < 10
      if @rolls[first_in_frame] + @rolls[first_in_frame + 1] == 10
        score += 10 + @rolls[first_in_frame + 2] 
      else
      score += @rolls[first_in_frame] + @rolls[first_in_frame + 1]
      end

      frame += 1
      first_in_frame += 2
    end
    score
  end
end
