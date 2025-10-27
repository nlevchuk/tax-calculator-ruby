module TaxCalculator
  module Parsers
    class Base
      def parse(raw_data)
        raise EmptyInputError.new if raw_data.empty?
      end
    end
  end
end
