module TaxCalculator
  class FileReader
    def read(filepath)
      if (!filepath || filepath.empty?)
        raise InvalidFilepathError, 'Provide valid path to the file'
      end

      fullpath = File.expand_path(File.join('../../', filepath), __dir__)
      if (!File.exist?(fullpath) || File.directory?(fullpath))
        raise FileReaderError, 'The file does not exist or is a directory'
      end

      File.open(fullpath, 'r', &:read)
    end
  end
end