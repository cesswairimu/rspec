require_relative '../lib/bowling_game'
describe BowlingGame do
  it 'scores a gutter game' do
    game = BowlingGame.new
    game.pin([0] * 20)
    expect(game.score).to eq(0)
  end

  it 'scores a game of 1s' do
  end
end
