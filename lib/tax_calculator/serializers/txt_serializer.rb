require_relative 'base'

module TaxCalculator
  module Serializers
    class TxtSerializer < Base
      def serialize(items)
        super

        result = @receipt.items.map { |item| prepare_item_line(item) }
        result << "Sales Taxes: #{format_money(@receipt.total_sales_tax)}"
        result << "Total: #{format_money(@receipt.total_price)}"
        result.join("\n")
      end

      private

      def prepare_item_line(item)
        "#{item.quantity} #{item.name}: #{format_money(item.final_price)}"
      end

      def format_money(value)
        format('%.2f', value.to_s('F'))
      end
    end
  end
end
