require_relative 'base'

module TaxCalculator
  module Parsers
    class TxtParser < Base
      def parse(raw_data)
        super

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

        Models::Item.new(quantity:, name:, shelf_price:)
      end
    end
  end
end
