require_relative '../lib/playground'

describe Playground do
  context 'when there are no children' do

  it 'is quite boring' do
    playground = Playground.new
    mood = playground.mood
  expect(mood).to  eq('boring')

  end

  it 'is empty '
  end
end

