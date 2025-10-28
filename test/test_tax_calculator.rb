require_relative 'test_helper'

describe TaxCalculator do
  let(:tax_calculator) do
    TaxCalculator::Processor.new(
      file_reader: TaxCalculator::FileReader.new,
      parser: TaxCalculator::Parsers::TxtParser.new,
      serializer: TaxCalculator::Serializers::TxtSerializer.new
    )
  end

  describe 'when the input is empty' do
    it 'raises an error' do
      _(-> { tax_calculator.process('') }).must_raise(TaxCalculator::InvalidFilepathError)
    end
  end

  describe 'when the file does not exist or is a directory' do
    # Missing the shelf price from the 2nd line
    it 'raises an error' do
      not_existed = 'test/fixtures/inputs/not_existed.txt'
      _(-> { tax_calculator.process(not_existed) }).must_raise(TaxCalculator::FileReaderError)

      directory = 'test/fixtures/inputs/'
      _(-> { tax_calculator.process(directory) }).must_raise(TaxCalculator::FileReaderError)
    end
  end

  describe 'when the input is invalid' do
    # Missing the shelf price from the 2nd line
    it 'raises an error' do
      filepath = 'test/fixtures/inputs/invalid.txt'
      _(-> { tax_calculator.process(filepath) }).must_raise(TaxCalculator::InvalidInputError)
    end
  end

  describe 'when the input exists' do
    it 'returns correct output for input 1' do
      filepath = 'test/fixtures/inputs/1.txt'
      output = fixture_read('outputs/1.txt')

      _(tax_calculator.process(filepath)).must_equal output
    end

    it 'returns correct output for input 2' do
      filepath = 'test/fixtures/inputs/2.txt'
      output = fixture_read('outputs/2.txt')

      _(tax_calculator.process(filepath)).must_equal output
    end

    it 'returns correct output for input 3' do
      filepath = 'test/fixtures/inputs/3.txt'
      output = fixture_read('outputs/3.txt')

      _(tax_calculator.process(filepath)).must_equal output
    end
  end
end
