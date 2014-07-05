require 'pry'
$root = File.expand_path('../../../', __FILE__)
require "#{$root}/spec/spec_helper"

describe Rucamat::SystemInteractor do
  it 'searches the filesystem correctly' do
    all_ruby_files = Rucamat::SystemInteractor.all_ruby_files("#{$root}/spec/fixtures/")
    foo_ruby_files = Rucamat::SystemInteractor.grep_system_for_files('foo', "#{$root}/spec/fixtures/")
    bar_ruby_files = Rucamat::SystemInteractor.grep_system_for_files('bar', "#{$root}/spec/fixtures/")

    expect(all_ruby_files.count).to eq(2)
    expect(foo_ruby_files.count).to eq(1)
    expect(bar_ruby_files.count).to eq(2)
  end
end
