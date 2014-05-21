=begin

	Define a class BookInStock which represents a book with an isbn number, isbn, and price of the book as a 
	floating-point number, price, as attributes. The constructor should accept the ISBN number (a string) as 
	the first argument and price as second argument, and should raise ArgumentError (one of Ruby's built-in 
	exception types) if the ISBN number is the empty string or if the price is less than or equal to zero.

	Include the proper getters and setters for these attributes. Include a method price_as_string that returns
	the price of the book with a leading dollar sign and trailing zeros, that is, a price of 20 should display 
	as "$20.00" and a price of 33.8 should display as "$33.80".

	Please put the class in a single file and upload it using the upload form below:
=end


class BookInStock
	attr_accessor :price, :isbn
	def initialize(isbn, price)
	  	raise ArgumentError if isbn.empty? || price == 0
    		@isbn = isbn
    		@price = price 
	end
	
	def price_as_string
	  	#sprintf('$%.2f', @price)
	  	format('$%.2f', @price)
	end
end


#=begin
#***************************** Test Code ***************************** 
book = BookInStock.new("1234", 29)
p "Price of ISBN: #{book.isbn} is #{book.price_as_string}"

next_book = BookInStock.new("ISBN123", "30")
p "Price of Book with ISBN: #{next_book.isbn} is #{next_book.price_as_string}"
#=end
