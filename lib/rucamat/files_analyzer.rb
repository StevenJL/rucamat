module Rucamat
  class FilesAnalyzer

    def initialize(files, sort)
      @files = files
      @sort = sort
      # files is actually an array of strings
    end

    def perform
      @files.each do |file|
        Rucamat::FileAnalyzer.new(file).perform
      end
    end
  end
end
