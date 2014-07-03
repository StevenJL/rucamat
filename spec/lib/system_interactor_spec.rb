require 'pry'
$root = File.expand_path('../../../', __FILE__)
require "#{$root}/spec/spec_helper"

describe Rucamat::SystemInteractor do
  lines_array = Rucamat::SystemInteractor.grep_system_for_files('foo', "#{$root}/spec/fixtures/")
  binding.pry
end