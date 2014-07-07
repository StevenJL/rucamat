module Rucamat
  module Representers
    class Main
      def initialize
        @stats = Rucamat::Representers::Stats.new
        @classes = []
        @modules = []
        @functions = []
      end

      def merge(main_object)
        @main_ext = main_object
        merge_modules
        merge_classes
        merge_functions
      end

      private
      def merge_type(type)
        array_ext = @main_ext.send(type)
        return if array_ext.empty?
        array_int_names = self.send(type).map {|obj| obj.name}
      end
    end
  end
end
