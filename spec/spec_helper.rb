$root = File.expand_path('../../', __FILE__)
require "#{$root}/lib/rucamat"
require 'pry'

describe Rucamat::SystemInteractor do
  lines_array = SystemInteractor.grep_system('foo', "#{$root}/spec/fixtures/sample_ruby_code")
  binding.pry
end