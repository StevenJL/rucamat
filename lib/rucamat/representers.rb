module Rucamat
  class MainRepresenter

  end

  Main = Struct.new(:search_stats, :modules, :classes, :methods)
  SearchStats = Struct.new(:num_of_classes, :num_of_modules, :num_of_methods, :num_of_lines)
  Moduel = Struct.new(:name, :num_of_lines, :classes, :methods, :search_result)
  Klass = Struct.new(:name, :num_of_lines, :methods, :search_result)
  Methud = Struct.new(:name, :num_of_lines, :search_result)
end
