module Rucamat
  module Representers
    class Class
      attr_accessor :name, :num_of_lines, :locations, :methods

      def initialize(name)
        @name = name
      end
    end
  end
end
