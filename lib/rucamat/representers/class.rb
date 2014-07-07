module Rucamat
  module Representers
    class Class

      def initialize(name, methods=[], locations=[])
        @name = name
        @methods = methods
        @locations = locations
      end

      def ==(arg)
        self.name == arg.name
      end

      def merge(obj)
        return unless @name == obj.name
        obj.methods


      end
    end
  end
end
