module MyModule
  class MyClass
    def some_method
      puts "foo"
    end

    def self.class_method
      puts "bar"
    end
  end
end

class AnotherClass
  def another_method
    puts "foo"
    puts "bar"
  end
end

def not_in_class_method
  puts "foo"
end