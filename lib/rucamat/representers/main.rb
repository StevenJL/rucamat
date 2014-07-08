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
        [:classes, :modules, :functions].each do |type|
          merge_type(type)
        end
      end

      private
      def merge_type(type)
        array_ext = @main_ext.send(type)
        return if array_ext.empty?
        array_int = self.send(type)
        array_new = []

        array_int.include?



      end


    end
  end
end
