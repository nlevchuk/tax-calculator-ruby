require_relative 'test_helper'

require 'tax_calculator'
require 'tax_calculator/input/text'
require 'tax_calculator/output/text'

describe TaxCalculator do
  before do
    @options = {
      input: TaxCalculator::Input::Text.new,
      output: TaxCalculator::Output::Text.new
    }
  end

  describe 'when the input is empty' do
    it 'raises an error' do
      _(-> { TaxCalculator.run('', **@options) }).must_raise
    end
  end

  describe 'when any line in the input is invalid' do
    before do
      # Missing the shelf price from the 2nd line
      @invalid_input = "2 book at 12.49\n1 music CD at\n1 chocolate bar at 0.85"
    end

    it 'raises an error' do
      _(-> { TaxCalculator.run(@invalid_input, **@options) }).must_raise
    end
  end

  describe 'when the input exists' do
    it 'returns correct output for input 1' do
      input = "2 book at 12.49\n1 music CD at 14.99\n1 chocolate bar at 0.85"
      output = "2 book: 24.98\n1 music CD: 16.49\n1 chocolate bar: 0.85\nSales Taxes: 1.50\nTotal: 42.32"

      _(TaxCalculator.run(input, **@options)).must_equal output
    end

    it 'returns correct output for input 2' do
      input = "1 imported box of chocolates at 10.00\n1 imported bottle of perfume at 47.50"
      output = "1 imported box of chocolates: 10.50\n1 imported bottle of perfume: 54.65\nSales Taxes: 7.65\nTotal: 65.15"

      _(TaxCalculator.run(input, **@options)).must_equal output
    end

    it 'returns correct output for input 3' do
      input = "1 imported bottle of perfume at 27.99\n1 bottle of perfume at 18.99\n1 packet of headache pills at 9.75\n3 imported boxes of chocolates at 11.25"
      output = "1 imported bottle of perfume: 32.19\n1 bottle of perfume: 20.89\n1 packet of headache pills: 9.75\n3 imported boxes of chocolates: 35.55\nSales Taxes: 6.70\nTotal: 98.38"
      # Seems the Sales Tax amount is invalid =>
      # "1 imported bottle of perfume: 32.19\n1 bottle of perfume: 20.89\n1 packet of headache pills: 9.75\n3 imported boxes of chocolates: 35.55\nSales Taxes: 7.90\nTotal: 98.38"

      _(TaxCalculator.run(input, **@options)).must_equal output
    end
  end
end
