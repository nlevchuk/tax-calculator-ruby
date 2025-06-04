module TaxCalculator
  module Input
    class Base
      def get_raw_data(text)
        raise "Implemented in child classes"
      end

      def parse(raw)
        raise "Implemented in child classes"
      end
    end
  end
end
