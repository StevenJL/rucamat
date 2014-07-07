module Rucamat
  module Representers
    class Class
      attr_reader :name, :methods, :locations

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
        self_methods = self.methods.map { |m| m.name }
        obj.methods.each do |meth|
          self.methods << meth unless self_methods.include?(meth.name)
        end
      end
    end
  end
end
