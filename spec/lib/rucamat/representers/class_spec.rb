$root = File.expand_path('../../../../../', __FILE__)
require "#{$root}/spec/spec_helper"

describe Rucamat::Representers::Class do
  it 'uses the name to establish identity' do
    klass1 = Rucamat::Representers::Class.new('Foo')
    klass2 = Rucamat::Representers::Class.new('Foo')
    klass3 = Rucamat::Representers::Class.new('Bar')

    expect(klass1 == klass2).to eq(true)
    expect(klass2 == klass3).to eq(false)
  end

  it 'merges another class correctly' do
    method1 = Rucamat::Representers::Method.new('bar1', [])
    method2 = Rucamat::Representers::Method.new('bar2', [])
    method3 = Rucamat::Representers::Method.new('bar3', [])

    klass1 = Rucamat::Representers::Class.new('Foo', [method1, method2])
    klass2 = Rucamat::Representers::Class.new('Foo', [method2, method3])
    klass1.merge(klass2)

    methods_array = klass1.methods

    expect(methods_array).to include(method1)
    expect(methods_array).to include(method2)
    expect(methods_array).to include(method3)
  end
end
