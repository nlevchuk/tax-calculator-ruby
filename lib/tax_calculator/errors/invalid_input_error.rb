module TaxCalculator
  module Errors
    class InvalidInputError < ArgumentError
      def initialize(line)
        super("The line is invalid '#{line}'. It should be in the format: 'QUANTITY NAME at SHELF_PRICE'")
      end
    end
  end
end
