module Rucamat
  module Representers
    class Main < Rucamat::Representers::Base
      attr_accessor :stats, :classes, :modules, :functions

      def initialize
        @stats = Rucamat::Representers::Stats.new
        @classes = []
        @modules = []
        @functions = []
      end
    end
  end
end
