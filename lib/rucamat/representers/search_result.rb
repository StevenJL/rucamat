module Rucamat
  module Representers
    class SearchResult
      attr_accessor :line_number, :search_result

      def initialize(line_number, search_result)
        @line_number = line_number
        @search_result = search_result
      end
    end
  end
end
