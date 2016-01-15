require 'csv'
require_relative 'book_in_stock'

class CsvReader
	def initialize
		@books_in_stock = []
	end
	
	def read_in_csv_data(csv_file_name)
		CSV.foreach(csv_file_name, headers: true) do |row|
			@books_in_stock << BookInStock.new(row["ISBN"], row["Amount"])
		end
	end
	
	def total_value_in_stock
		sum = 0.0
		@books_in_stock.each {|bookie| sum += bookie.price}
		sum
	end
	
	def books_in_stock1 # Just for testing
		@books_in_stock
	end
	
end

book_one = CsvReader.new
book_one.read_in_csv_data("data.csv")
puts "The second element is #{book_one.books_in_stock1[2]}"
