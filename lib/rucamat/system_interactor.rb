module Rucamat
  class SystemInteractor
    def self.grep_system_for_files(search_str, dir, options={})
      cmd_str ="grep -R '#{search_str}' #{dir}"
      results = `#{cmd_str}`
      lines_array = results.split("\n")
      return lines_array if options.empty?
      lines_array.map { |line| line.split(options[:delimiter]).first(options[:count]).first }
    end

    def self.all_ruby_files(dir)
      cmd_str = "find #{dir} -regex \".*rb\""
    end
  end
end