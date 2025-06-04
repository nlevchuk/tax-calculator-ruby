require_relative 'base'

module TaxCalculator
  module TaxStrategies
    class BasicTax < Base
      EXEMPTIONS = ['book', 'chocolate', 'pill']

      def initialize
        super(10)
      end

      def can_apply?(item)
        !exempt?(item.name)
      end

      private

      def exempt?(name)
        name.downcase.match(EXEMPTIONS.join('|'))
      end
    end
  end
end
