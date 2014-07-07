module Rucamat
  class Generator

    def initialize(options)
      @directory = options['directory']
      @sort = options['sort']
      @query = options['query']
      @class = options['class']
      @module = options['module']
      @sort = option['sort']
    end

    def perform
      if @query
        @files = Rucamat::SystemInteractor.grep_system_for_files(
          @query, 
          @directory
        )
      else
        @files = Rucamat::SystemInteractor.all_ruby_files(
          @query, 
          @directory
        )
      end

      filter_by_class if @class
      filter_by_module if @module
      main = Rucamat::FilesAnalyzer.new(@files, @sort).perform
      Rucamat::Presenter.new(main).perform
    end

    private

    def filter_by_class
      @class_files = Rucamat::SystemInteractor.grep_system_for_files(
        "class #{@class}",
         @directory
         )
      @files &= @class_files
    end

    def filter_by_module
      @module_files = Rucamat::SystemInteractor.grep_system_for_files(
        "module #{@module}",
        @directory
        )
      @files &= @module_files
    end
  end
end
