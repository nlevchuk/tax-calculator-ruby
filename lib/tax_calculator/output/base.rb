module TaxCalculator
  module Output
    class Base
      def prepare_output(items)
        raise 'Implemented in child classes'
      end

      protected

      def format_money(value)
        format('%.2f', value.to_s('F'))
      end
    end
  end
end
