require 'pry'
$root = File.expand_path('../../../../../', __FILE__)
require "#{$root}/spec/spec_helper"

describe Rucamat::Representers::Main do
  it 'merges another main correctly' do
    binding.pry
    klass1 = Rucamat::Representers::Class.new('Foo')
    klass2 = Rucamat::Representers::Class.new('Bar')
    klass3 = Rucamat::Representers::Class.new('Baz')

    main1 = Rucamat::Representers::Main.new
    main1.classes = [klass1, klass2]

    main2 = Rucamat::Representers::Main.new
    main2.classes = [klass2, klass3]

    main1.merge(main2)

    classes_array = main1.classes

    classes_array.should include(klass1)
    classes_array.should include(klass2)
    classes_array.should include(klass3)
  end
end
