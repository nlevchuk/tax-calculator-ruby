require_relative 'base'

module TaxCalculator
  module TaxStrategies
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
