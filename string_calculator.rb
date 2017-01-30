require 'minitest/autorun'
class Calculator
  def initialize(digit_string)
    @digits = digit_string.split(',').map { |n| n.to_i}
  end
  def sum
    @digits.inject(:+)
  end
end
  describe Calculator do
     it 'sums the digits given' do
     calc = Calculator.new('1,2,3,4')
     calc.sum.must_equal(10)
  end
end
