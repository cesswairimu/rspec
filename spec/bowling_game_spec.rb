require_relative '../lib/bowling_game'
describe BowlingGame do
  let(:game) { BowlingGame.new }

  it 'scores a gutter game' do
    game.pin([0] * 20)
    expect(game.score).to eq(0)
  end

  it 'scores a game of 1s' do
    game.pin([1] * 20)
    expect(game.score).to eq(20)
  end

  it 'scores a game with spares' do
    game.pin([4,6,5] + [0]* 17)
    expect(game.score).to eq(20)
  end
end
