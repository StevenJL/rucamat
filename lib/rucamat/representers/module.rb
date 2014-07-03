module Rucamat
  module Representers
    class Module
      attr_accessor :name, :num_of_lines, :classes, :methods, :modules

      def initialize(name)
        @name = name
        @classes = []
        @methods = []
      end
    end
  end
end
