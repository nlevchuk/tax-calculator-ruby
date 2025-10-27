module TaxCalculator
  module Strategies
    class Base
      ROUNDING_UNIT = 0.05

      def initialize(tax_rate)
        @tax_rate = tax_rate
      end

      def can_apply?(item)
        raise NotImplementedError
      end

      def calculate(shelf_price)
        raw_tax_amount = get_raw_tax_amount(shelf_price)
        apply_rounding_rule(raw_tax_amount)
      end

      private

      def get_raw_tax_amount(shelf_price)
        (shelf_price * @tax_rate) / 100
      end

      # Up to the nearest ROUNDING_UNIT
      def apply_rounding_rule(tax_amount)
        ((tax_amount / ROUNDING_UNIT).ceil.to_d * ROUNDING_UNIT).round(2)
      end
    end
  end
end
