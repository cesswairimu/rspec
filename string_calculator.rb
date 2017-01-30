require 'minitest/autorun'
class Calculator
  attr_reader :digits
  def initialize(digits_string)
    @digits = parse_input(digits_string)
  end
  def sum
    digits.inject(:+)
  end

  private
  def parse_input(str)
    str.split(',').map { |n| n.to_i}
  end
end
describe Calculator do
  it 'sums the digits given' do
    calc = Calculator.new('1,2,3,4')
    calc.sum.must_equal(10)
  end

  it 'multiplies the digits' do
    calc = Calculator.new('4,3')
    calc.multiply.must_equal(12)
  end
end
