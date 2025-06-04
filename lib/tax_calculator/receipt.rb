module TaxCalculator
  class Receipt
    attr_reader :items

    def initialize(items)
      @items = items
    end

    def total_sales_tax
      @items.sum(&:tax_amount)
    end

    def total_price
      @items.sum(&:final_price)
    end
  end
end
