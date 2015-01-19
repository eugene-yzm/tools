# This tool iterates through a list of xls files that have the same amount columns (Information is stored in the same way).

require 'roo'
require 'spreadsheet'
require 'enumerator'

# Create workbook object to hold the new xls information
output = Spreadsheet::Workbook.new
sheet = output.create_worksheet

#Path of the files
input_path = '/Users/eugene/Documents/geo/XLS-TOOL/*.xls'

#Interate through each xls file
Dir.glob(input_path) do |file|  
	puts "Adding: " + file.split('/')[-1]

	s = Roo::Spreadsheet.open(file)
	num_row = s.column(1).length
	num_col = s.row(1).length
	counter = 2

	# appending the new xls file row by row
	while counter <= num_row
		# Seems like Spreadsheets does not allow for pushing row by row
		# sheet.rows.push(s.row(counter))

		# iterating through individual columns in a row
		col = 1
		while col <= 6

		counter += 1
	end 
	# puts s.column(1).length
	# puts s.row(1).length 
	# puts s.row(2)
end

#Create new xls file and write spreadsheet object to it
output.write "out.xls"