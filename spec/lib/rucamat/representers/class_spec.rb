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
    klass1 = Rucamat::Representers::Class.new('Foo')
    klass2 = Rucamat::Representers::Class.new('Foo')
  end
end
