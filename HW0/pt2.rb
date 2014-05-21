=begin
	
	Define a method hello(name) that takes a string representing a name and returns the string "Hello, " concatenated with the name.

	Define a method starts_with_consonant?(s) that takes a string and returns true if it starts with a 
	consonant and false otherwise. (For our purposes, a consonant is any letter other than A, E, I, O, U.)
	NOTE: be sure it works for both upper and lower case and for nonletters!

	Define a method binary_multiple_of_4?(s) that takes a string and returns true if the string represents
	a binary number that is a multiple of 4. NOTE: be sure it returns false if the string is not a valid 
	binary number!
	
=end

def hello(name)
    "Hello, #{name}"
end

#=begin
#***************************** Test Code *****************************
puts "Result for hello methods are:-"
p hello("Puru") == "Hello, Puru"
#=end

def starts_with_consonant?(s)
  #return true if s =~ /^A\[aeiou]/ #does not check integers,symbols
 	#return true if s =~ /^[bcdfghjklmnpqrstvwxyz]/i
  #or just !!(s =~ /^[bcdfghjklmnpqrstvwxyz]/i)
 	return true if s =~ /^[b-df-hj-np-tv-z]/i
 	false
   # !! on regex makes sure that it returns boolean value
   # ^ on regex gives similar meaning as include?
   # i on regex means its not case sensetive, either capital or small letter works
end

#=begin
#***************************** Test Code *****************************
puts "Result for starts_with_consonant? methods are:-"
p starts_with_consonant?("apple") == false
p starts_with_consonant?("ball") == true
p starts_with_consonant?("Ball") == true
p starts_with_consonant?("$100") == false
p starts_with_consonant?(1000) == false
p starts_with_consonant?("1999") == false
#=end

def binary_multiple_of_4?(s)
  if /\A[01]+\Z/.match(s)
  	s.to_i(2) % 4 == 0
  else
  	false
  end
end

#=begin
#***************************** Test Code *****************************
puts "Result for binary_multiple_of_4? methods are:-"
p binary_multiple_of_4?(32.to_s(2)) == true
p binary_multiple_of_4?("1000") == true
p binary_multiple_of_4?("1001") == false
p binary_multiple_of_4?(30.to_s(2)) == false
p binary_multiple_of_4?("1000") == true
p binary_multiple_of_4?("1010") == false
p binary_multiple_of_4?("1020") == false
#=end
