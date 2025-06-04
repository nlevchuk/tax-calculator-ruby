require_relative 'base'

module TaxCalculator
  module Input
    class Text < Base
      def get_raw_data(str)
        raise 'Empty input' if str.empty?

        str
      end

      def parse(raw_data)
        raw_data
          .split("\n")
          .map(&:strip)
          .reject(&:empty?)
          .map { |line| parse_line(line) }
      end

      private

      def parse_line(line)
        raw = line.split

        quantity = raw.shift.to_s
        shelf_price = raw.pop.to_s
        raw.pop # Remove 'at'
        name = raw.join(' ')

        if (
          [quantity, name, shelf_price].any?(&:empty?) ||
          shelf_price.to_d == '0.0'.to_d
        )
          raise 'The line is invalid'
        end

        { quantity:, name:, shelf_price: }
      end
    end
  end
end
