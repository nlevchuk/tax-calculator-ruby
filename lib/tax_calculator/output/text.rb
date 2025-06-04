require_relative 'base'

module TaxCalculator
  module Output
    class Text < Base
      def prepare_output(items)
        result = items.map { |item| prepare_item_line(item) }
        result << "Sales Taxes: #{format_money(total_sales_tax(items))}"
        result << "Total: #{format_money(total_price(items))}"
        result.join("\n")
      end

      private

      def prepare_item_line(item)
        "#{item.quantity} #{item.name}: #{format_money(item.final_price)}"
      end

      def total_sales_tax(items)
        items.sum(&:tax_amount)
      end

      def total_price(items)
        items.sum(&:final_price)
      end
    end
  end
end
