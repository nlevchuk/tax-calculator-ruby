$LOAD_PATH.unshift File.expand_path('../lib', __dir__)

require 'minitest/autorun'

require 'tax_calculator'

def fixture_path(filepath)
  File.expand_path(File.join('fixtures', filepath), __dir__)
end

def fixture_read(filepath)
  File.open(fixture_path(filepath), 'r', &:read)
end