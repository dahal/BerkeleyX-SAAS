=begin
	
HW 1-4: RUBY METAPROGRAMMING  (100 points possible)
Specs: spec/attr_accessor_with_history_spec.rb

In lecture we saw how attr_accessor uses metaprogramming to create getters and setters for object attributes on the fly.

Define a method attr_accessor_with_history that provides the same functionality as attr_accessor but also tracks every value the attribute has ever had:

class Foo 
  attr_accessor_with_history :bar
end

f = Foo.new        
f.bar = 3          # => 3
f.bar = :wowzo     # => :wowzo
f.bar = 'boo!'     # => 'boo!'
f.bar_history      # => [nil, 3, :wowzo]
(Calling bar_history before bar's setter is ever called should return nil.)

History of instance variables should be maintained separately for each object instance. that is:

f = Foo.new
f.bar = 1 ; f.bar = 2
g = Foo.new
g.bar = 3 ; g.bar = 4
g.bar_history
  
then the last line should just return [nil,3], rather than [nil,1,3].

If you're interested in how the template works, the first thing to notice is that if we define attr_accessor_with_history in class Class, we can use it as in the snippet above. This is because a Ruby class like Foo or String is actually just an object of class Class. (If that makes your brain hurt, just don't worry about it for now. It'll come.)

The second thing to notice is that Ruby provides a method class_eval that takes a string and evaluates it in the context of the current class, that is, the class from which you're calling attr_accessor_with_history. This string will need to contain a method definition that implements a setter-with-history for the desired attribute attr_name.

HINTS:

Don't forget that the very first time the attribute receives a value, its history array will have to be initialized.
An attribute's initial value is always nil by default, so if foo_history is referenced before foo has ever been assigned, the correct answer is nil, but after the first assignment to foo, the correct value for foo_history would be [nil].
Don't forget that instance variables are referred to as @bar within getters and setters, as Section 3.4 of the ESaaS textbook explains.
Although the existing attr_accessor can handle multiple arguments (e.g. attr_accessor :foo, :bar), your version just needs to handle a single argument.
Your implementation should be general enough to work in the context of any class and for attributes of any (legal) variable name
Note that one powerful metaprogramming feature in Ruby is class_eval that can be called in the meta-class Class. class_eval can interpret a string on the fly to create some new code. In the example below, we define add_method() to the meta-class (and, through inheritance, to any class). When called, this method defines a new method that return 42 (notice how #{name} gets replaced with the parameter passed to add_method).

class Class
  def add_method(name)
    class_eval %Q"
      def #{name}()
        42
      end
      "
    end
  end

class MyClass
  add_method :my_method
end

mc = MyClass.new
puts mc.my_method # => 42
=end

class Class
	def attr_accessor_with_history(attr_name)
		attr_name = attr_name.to_s # make sure it's a string
		attr_reader attr_name # create the attribute's getter
		attr_reader attr_name+"_history" # create bar_history getter
		class_eval %Q{
			# YOUR CODE HERE
			def #{attr_name}=(value)
				if @#{attr_name}_history.nil?
					@#{attr_name}_history = []
				end
				@#{attr_name}_history << @#{attr_name}
				@#{attr_name} = value  	
			end
		}
	end
end
