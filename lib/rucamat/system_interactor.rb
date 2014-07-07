require 'shellwords'
require 'open3'

module Rucamat
  class SystemInteractor
    class << self
      def grep_system_for_files(query, dir)
        cmd_str ="grep -l -R --include \"*.rb\" '#{safe_it(query)}' #{safe_it(dir)}"        
        results = send_to_system(cmd_str)
      end

      def all_ruby_files(dir)
        cmd_str = "find #{safe_it(dir)} -name \"*.rb\""
        results = send_to_system(cmd_str)
      end

      private
      def safe_it(str)
        Shellwords.escape(str)
      end

      def send_to_system(cmd_str)
        stdin, stdout, stderr = Open3.popen3(cmd_str)        
        results_array = stdout.read.split("\n")
      end
    end
  end
end
