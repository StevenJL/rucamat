module Rucamat
  class FilesAnalyzer

    def initialize(files, sort)
      # files is actually an array of strings
      @files = files
      @sort = sort
      @main = Rucamat::Representers::Main.new
    end

    def perform
      @files.each do |file|
        analysis_result = Rucamat::FileAnalyzer.new(file).perform
        @main.merge(analysis_result)
      end
      @main
    end
  end
end
