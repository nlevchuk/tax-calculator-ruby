require_relative '../errors/invalid_input_error'

module TaxCalculator
  module Input
    module LineParser
      def self.parse(line)
        raw = line.split

        quantity = raw.shift.to_s
        shelf_price = raw.pop.to_s
        raw.pop # Remove 'at'
        name = raw.join(' ')

        if (
          [quantity, name, shelf_price].any?(&:empty?) ||
          shelf_price.to_d == '0.0'.to_d
        )
          raise Errors::InvalidInputError.new(line)
        end

        { quantity:, name:, shelf_price: }
      end
    end
  end
end
