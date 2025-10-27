module TaxCalculator
  module Serializers
    class Base
      def serialize(items)
        @receipt = Models::Receipt.new(items)
      end
    end
  end
end
