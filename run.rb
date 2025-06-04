require_relative 'lib/tax_calculator'
require_relative 'lib/tax_calculator/input/text'
require_relative 'lib/tax_calculator/output/text'

input = ARGV.first
options = {
  input: TaxCalculator::Input::Text.new,
  output: TaxCalculator::Output::Text.new
}

puts TaxCalculator.run(input, **options)
