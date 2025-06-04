require_relative 'tax_calculator/item'
require_relative 'tax_calculator/tax_strategies/basic_tax'
require_relative 'tax_calculator/tax_strategies/import_duty'
require_relative 'tax_calculator/calculator'

module TaxCalculator
  def self.run(source, input:, output:)
    raw_data = input.get_raw_data(source)
    item_attributes = input.parse(raw_data)

    items = item_attributes.map { |attrs| Item.new(**attrs) }
    tax_strategies = [
      TaxStrategies::BasicTax.new,
      TaxStrategies::ImportDuty.new
    ]

    updated_items = Calculator.calculate(items, tax_strategies)

    output.prepare_output(updated_items)
  end
end
