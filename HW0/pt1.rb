=begin

	1. Define a method sum which takes an array of integers as an argument and returns the sum of its elements. For an empty array it should return zero.
	2. Define a method max_2_sum which takes an array of integers as an argument and returns the sum of its two largest elements. For an empty array it should return zero. For an array with just one element, it should return that element.
	3. Define a method sum_to_n? which takes an array of integers and an additional integer, n, as arguments and returns true if any two distinct elements in the array of integers sum to n. An empty array or single element array should both return false.

=end

#1. sum
def sum(array)
	if array.count == 0
		0
	else 
		array.reduce(:+) 
	end
endend

puts sum([3,1,2]) 		#=> 6
puts sum([])			#=>	0
puts sum([3])			#=> 3



#2. max_2_sum
def max_2_sum(array)
	return 0 if array.empty?
	return array.first if array.count == 1
	array.sort.last(2).reduce(:+)
end	

puts max_2_sum([3,1,2]) 		#=> 5
puts max_2_sum([])				#=>	0
puts max_2_sum([3])				#=> 3



#3. sum_to_n?
def sum_to_n?(array, n)
	return false if array.count == 0 || array.count == 1
	array.combination(2).to_a.any?{ |x| x.reduce(:+) == n }	
end

puts sum_to_n?([1, 2, 3], 5)	#true
puts sum_to_n?([1, 2, 3], 3)	#true
puts sum_to_n?([1, 2, 3], 4)	#true
puts sum_to_n?([1, 2, 3], 1)	#false
puts sum_to_n?([], 1)			#false
puts sum_to_n?([], 0)			#false
puts sum_to_n?([6], 6)			#false
puts sum_to_n?([6], 0)			#false