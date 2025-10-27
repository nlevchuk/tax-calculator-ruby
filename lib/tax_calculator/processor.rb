module TaxCalculator
  class Processor
    def initialize(file_reader:, parser:, serializer:)
      @file_reader, @parser, @serializer = file_reader, parser, serializer
    end

    def process(filepath)
      raw_data = @file_reader.read(filepath)
      items = @parser.parse(raw_data)

      tax_strategies = [
        Strategies::BasicTax.new,
        Strategies::ImportDuty.new
      ]
      updated_items = Calculator.calculate(items, tax_strategies)

      @serializer.serialize(updated_items)
    end
  end
end
