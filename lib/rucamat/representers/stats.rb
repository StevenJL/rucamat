module Rucamat
  module Representers
    class Stats
      attr_accessor :num_of_classes, :num_of_modules, :num_of_methods

      def incr(type)
        case type
        when 'class'
          @num_of_classes =+ 1
        when 'module'
          @num_of_modules =+ 1
        when 'method'
          @num_of_methods =+ 1
        end
      end
    end
  end
end
