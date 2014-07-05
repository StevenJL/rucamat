require 'thor'

module Rucamat
  class CLI < Thor
    class_option :directory,
      :alias => '-d', 
      :desc => "specify directory", 
      :default => "."

    class_option :query,
      :alias => '-q',
      :desc => "query for a string"

    class_option :class,
      :alias => '-cl',
      :desc => 'specify class'

    class_option :module,
      :alias => '-mo',
      :desc => 'specify module'

    class_option :sort,
      :alias => '-sr',
      :desc => 'specify sorting of results'

    desc 'generate', "generates class, module, and methods report"
    def generate
      puts "HIT GENERATE"
      puts "#{options}"
    end
  end
end
