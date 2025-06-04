require_relative 'base'
require_relative 'line_parser'

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
          .map { |line| LineParser.parse(line) }
      end
    end
  end
end
