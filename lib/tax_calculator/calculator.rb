module TaxCalculator
  module Calculator
    def self.calculate(items, tax_strategies)
      return items if items.empty? || tax_strategies.empty?

      items.map do |item|
        tax_amount = tax_strategies
          .filter { |strategy| strategy.can_apply?(item) }
          .sum    { |strategy| strategy.calculate(item.shelf_price) }

        item.update_tax(tax_amount)
        item
      end
    end
  end
end
