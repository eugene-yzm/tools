# reads and writes xls
require "csv"
require 'roo'
require 'spreadsheet'

parsed_file = CSV.read("US.txt", { :col_sep => "\n" })

# Create workbook object to hold the new xls information
output = Spreadsheet::Workbook.new
sheet = output.create_worksheet

# number of lines
n = parsed_file.length


# puts line = parsed_file[0].join.squeeze("\t").split("\t")
count = 0
for line in parsed_file
	line = parsed_file[count].join.split("\t")
	for cell in line
		sheet.row(count).push(cell)
	end
	count += 1
end

#Create new xls file and write spreadsheet object to it
output.write "op.xls"