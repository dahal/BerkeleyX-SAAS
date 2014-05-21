class Dessert
	attr_accessor :name, :calories
	def initialize(name, calories)
		# your code here
		@name = name
		@calories = calories
	end
	def healthy?
		# your code here
		return true if @calories < 200
		#false
	end
	def delicious?
		# your code here
		true
	end
end

class JellyBean < Dessert
	attr_accessor :flavor
	def initialize(flavor)
		# your code here
		@flavor = flavor
		@calories = 5
		@name = @flavor + " jelly bean"
	end

	def delicious?
		return false if @flavor == "licorice"
		true
	end
end
