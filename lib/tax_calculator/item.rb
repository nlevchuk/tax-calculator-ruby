module TaxCalculator
  class Item
    attr_reader :quantity, :name, :shelf_price, :tax_amount

    def initialize(quantity:, name:, shelf_price:)
      @quantity = quantity.to_i
      @name = name
      @shelf_price = shelf_price.to_d
      @tax_amount = BigDecimal("0")
    end

    def update_tax(value)
      @tax_amount = value.to_d
    end

    def final_price
      quantity * (shelf_price + tax_amount)
    end

    def imported?
      name.downcase.include?('imported')
    end
  end
end
