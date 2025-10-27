require 'bigdecimal/util'
require 'optparse'

require_relative 'tax_calculator/calculator'
require_relative 'tax_calculator/errors'
require_relative 'tax_calculator/file_reader'
require_relative 'tax_calculator/models/item'
require_relative 'tax_calculator/models/receipt'
require_relative 'tax_calculator/parsers/txt_parser'
require_relative 'tax_calculator/processor'
require_relative 'tax_calculator/serializers/txt_serializer'
require_relative 'tax_calculator/strategies/basic_tax'
require_relative 'tax_calculator/strategies/import_duty'

module TaxCalculator
  @@option_parser = OptionParser.new { |opts| opts.banner = 'Usage: bin/run FILEPATH' }

  def self.run(options)
    filepath = parse_options(options).first

    processor = Processor.new(
      file_reader: FileReader.new,
      parser: Parsers::TxtParser.new,
      serializer: Serializers::TxtSerializer.new
    )

    begin
      processor.process(filepath)
    rescue InvalidFilepathError => e
      puts e.message
      @@option_parser # show parser's banner
    rescue FileReaderError, InvalidInputError => e
      e.message
    end
  end

  def self.parse_options(options)
    @@option_parser.parse!(options)
  end
end
