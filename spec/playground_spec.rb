
require_relative '../lib/playground'

describe Playground do
  context 'when there are no children' do

    it 'is quite boring place' do
      playground = Playground.new(0)
      mood = playground.mood
      expect(mood).to  eq('boring')

    end

    it 'is empty' do 
      playground = Playground.new(0)
      expect(playground).to be_empty
    end
  end
end

