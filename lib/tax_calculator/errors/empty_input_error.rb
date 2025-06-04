module TaxCalculator
  module Errors
    class EmptyInputError < ArgumentError
      def initialize
        super('Empty input')
      end
    end
  end
end
