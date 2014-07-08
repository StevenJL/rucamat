module Rucamat
  module Representers
    class Class
      attr_reader :name, :classes, :methods, :paths

      def initialize(name, classes=[], methods=[], paths=[])
        @name = name
        @methods = Rucamat::Collection.new(methods)
        @classes = Rucamat::Collection.new(classes)
        @paths = paths
      end

      def ==(arg)
        self.name == arg.name
      end

      def merge(obj)
        return unless obj.class == self.class
        self.methods.merge(obj.methods)
        self.classes.merge(obj.classes)
        self.paths += obj.paths
      end
    end
  end
end
