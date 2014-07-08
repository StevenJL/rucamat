module Rucamat
  module Representers
    class Method
      attr_reader :name, :num_of_lines, :search_results, :locations

      def initialize(name, search_results=[], locations=[])
        @name = name
        @search_results = search_results
        @locations = locations
      end

      def ==(arg)
        self.name == arg.name
      end

      def merge(obj)
      end
    end
  end
end
