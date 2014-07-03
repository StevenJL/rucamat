require 'shellwords'

module Rucamat
  class SystemInteractor
    class << self
      def grep_system_for_files(query, dir)
        cmd_str ="grep -l -R --include \"*.rb\" '#{safe_it(query)}' #{safe_it(dir)}"
        results = `#{cmd_str}`
        lines_array = results.split("\n")
      end

      def all_ruby_files(dir)
        cmd_str = "find #{safe_it(dir)} -name \"*.rb\""
        results = `#{cmd_str}`
        files_array = results.split("\n")
      end

      private
      def safe_it(str)
        Shellwords.escape(str)
      end
    end
  end
end
