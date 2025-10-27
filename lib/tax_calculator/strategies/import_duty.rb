require_relative 'base'

module TaxCalculator
  module Strategies
    class ImportDuty < Base
      def initialize
        super(5)
      end

      def can_apply?(item)
        item.imported?
      end
    end
  end
end
