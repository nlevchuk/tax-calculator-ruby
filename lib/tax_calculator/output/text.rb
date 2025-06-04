require_relative 'base'

module TaxCalculator
  module Output
    class Text < Base
      def prepare_output(receipt)
        result = receipt.items.map { |item| prepare_item_line(item) }
        result << "Sales Taxes: #{format_money(receipt.total_sales_tax)}"
        result << "Total: #{format_money(receipt.total_price)}"
        result.join("\n")
      end

      private

      def prepare_item_line(item)
        "#{item.quantity} #{item.name}: #{format_money(item.final_price)}"
      end
    end
  end
end
